-- Consultas para visualizar dados das tabelas

select * from table01 a
where to_char(a.dt_exame, 'YYYY') = '2022';

select * from table02 b;

select * from table03 c;

select * from table04 d
where to_char(d.dt_atendimento, 'YYYY') = '2022';

select * from table05 e
where to_char(e.dt_pedido, 'YYYY') = '2022';


select a.atendimento,       -- Campos das Tabelas 
       a.acc_number,        
       a.status,            
       a.aprovador,         
       c.exame,             
       b.ds_exame,          
       d.dt_atendimento,    
       a.dt_exame,          
       e.dt_pedido + b.dt_data_entrega Data_de_Entrega -- Soma + Variável
  from table01                    a,    -- Tabelas
       table02                    b,    
       table03                    c,    
       table04                    d,    
       table05                    e     
 where to_char(a.dt_exame, 'YYYY') = '2022'         -- Transformar em Texto
       and b.cd_exa_rx = c.cd_exa_rx                -- Join
       and d.cd_atendimento = a.atendimento         
       and c.cd_ped_rx = e.cd_ped_rx                
       and e.cd_atendimento = d.cd_atendimento      
       and cd_itped_rx = a.acc_number               
       and a.aprovador = '1093';                    -- Dado específico
       and a.atendimento like '63%'                 -- Dado parecido
