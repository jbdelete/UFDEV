 static void AddCollisionImpulse( Cube& c0, 
								ube& c1,
								const Vector3& hitPoint,
								const Vector3& normal,
								float penetration)
{
	// Some simple check code.
	float invMass0 = (c0.m_mass>1000.0f) ? 0.0f : (1.0f/c0.m_mass);
	float invMass1 = (c1.m_mass>1000.0f) ? 0.0f : (1.0f/c1.m_mass); 

	invMass0 = (!c0.m_awake) ? 0.0f : invMass0;
	invMass1 = (!c1.m_awake) ? 0.0f : invMass1;

	const Matrix worldInvInertia0 = c0.m_invInertia;
	const Matrix worldInvInertia1 = c1.m_invInertia;

	// Both objects are non movable
	if ( (invMass0+invMass1)==0.0 ) return;

	Vector3 r0 = hitPoint - c0.m_c;
	Vector3 r1 = hitPoint - c1.m_c;

	Vector3 v0 = c0.m_linVelocity + Cross(c0.m_angVelocity, r0);
	
	Vector3 v1 = c1.m_linVelocity + Cross(c1.m_angVelocity, r1); 
	// Relative Velocity
	Vector3 dv = v0 - v1;
	// If the objects are moving away from each other
	// we dont need to apply an impulse
	float relativeMovement = -Dot(dv, normal);
	if (relativeMovement < -0.01f)
	{
		return;
	}
	// NORMAL Impulse 
	{
		// Coefficient of Restitution 
		float e = 0.0f;

		float normDiv = Dot(normal, normal) * ( (invMass0 + invMass1) + Dot( normal, Cross( Transform( Cross(r0, normal), worldInvInertia0), r0) +  Cross( Transform( Cross(r1, normal), worldInvInertia1), r1) ) );

		float jn = -1*(1+e)*Dot(dv, normal) / normDiv;

		// Hack fix to stop sinking
		// bias impulse proportional to penetration distance 
		jn = jn + (penetration*1.5f);

		c0.m_linVelocity += invMass0 * normal * jn;
		c0.m_angVelocity += Transform(Cross(r0, normal * jn), 
		worldInvInertia0);

		c1.m_linVelocity -= invMass1 * normal * jn;
		c1.m_angVelocity -= Transform(Cross(r1, normal * jn), 
		worldInvInertia1);
	}
	// TANGENT Impulse Code 
	{
	// Work out our tangent vector, with is perpendicular 
	// to our collision normal
	Vector3 tangent =Vector3(0,0,0);
	tangent = dv - (Dot(dv, normal) * normal);
	tangent = Normalize(tangent);

	float tangDiv = invMass0 + invMass1
	+ Dot( tangent, Cross((Cross(r0, tangent)
	* c0.m_invInertia), r0)
	+ Cross((Cross(r1, tangent) * c1.m_invInertia), r1) ); 
	float jt = -1 * Dot(dv, tangent) / tangDiv;
	// Clamp min/max tangental component

	// Apply contact impulse
	c0.m_linVelocity += invMass0 * tangent * jt;
	c0.m_angVelocity += Transform(Cross(r0, tangent * jt),
	worldInvInertia0);

	c1.m_linVelocity -= invMass1 * tangent * jt;
	c1.m_angVelocity -= Transform(Cross(r1, tangent * jt), 
	worldInvInertia1);
	} // TANGENT
}