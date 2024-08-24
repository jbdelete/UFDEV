delete (sprintf('%s%s','..\equations\','*.tex'));
%Eq = ' ';apos
%equat('Color001',Eq,0,0,0);


StartEqTex();

Eq= 'haus\left( A,B \right) = {max \atop {a \in A }} {min \atop {b \in B}} \left| a-b \right|';
equat('haus',Eq,0,0,0);
Eq= 'span\left( A,B \right) = {max \atop {a \in A }} {max \atop {b \in B}} \left| a-b \right|';
equat('span',Eq,0,0,0);
Eq= 'pd\left( A,B \right) = minimum \left\Vert v \right\Vert such \quad  that\quad  {min \atop {a \in A }} {min \atop {b \in B}} \left| \boldsymbol{a-b+v} \right|\geq0';
equat('pd',Eq,0,0,0);
Eq= 'gpd\left( A,B \right) = minimum \left\Vert \boldsymbol{M} \right\Vert_d such \quad  that\quad  {min \atop {a \in A }} {min \atop {b \in B}} \left| \boldsymbol{a-Mb} \right|\geq0';
equat('gpd',Eq,0,0,0);

Eq= '\hat{x}=\sfrac{\left(\vec{P_F}-\vec{P_T}\right)}{||\vec{x}||}';
equat('calcmom001',Eq,0,0,0); %avril
Eq= '\vec{x_f}=\hat{x}\bullet\vec{v_f}';
equat('calcmom002',Eq,0,0,0); %avril
Eq= '\vec{v_{fx}}=\hat{x}\left(\vec{x_f}\right)';
equat('calcmom003',Eq,0,0,0); %avril
Eq= '\vec{v_{fy}}=\vec{x_f}-\vec{v_{fx}}';
equat('calcmom004',Eq,0,0,0); %avril


Eq= '\hat{x}=-\hat{x}';
equat('calcmom005',Eq,0,0,0); %avril
Eq= '\vec{x_t}=\hat{x}\bullet\vec{v_t}';
equat('calcmom006',Eq,0,0,0); %avril
Eq= '\vec{v_{tx}}=\hat{x}\left(\vec{x_t}\right)';
equat('calcmom007',Eq,0,0,0); %avril
Eq= '\vec{v_{ty}}=\vec{x_f}-\vec{v_{tx}}';
equat('calcmom008',Eq,0,0,0); %avril

Eq= '\vec{V_f} = \vec{v_{fx}}\frac{(m_1-m_2)}{m_1+m_2}+\vec{v_{tx}}\frac{2(m_2)}{m_1+m_2}+\vec{v_{ty}}';
equat('calcmom009',Eq,0,0,0); %avril

Eq= '\hat{N}=\frac{\left(\vec{P_a}-\vec{P_b}\right)\otimes\left(\vec{P_a}-\vec{P_c}\right)}{||\vec{N}||}';
equat('bound001',Eq,0,0,0); %avril
Eq= '\vec{V_{out}} = \vec{V_{in}} - 2.0(\vec{V_{in}}\bullet\hat{N})\hat{N}';
equat('bound002',Eq,0,0,0); %avril







