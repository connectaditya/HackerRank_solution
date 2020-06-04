SELECT c.company_code, c.founder, 
       COUNT(DISTINCT l.lead_manager_code), COUNT(DISTINCT s.senior_manager_code),
       COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
FROM Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e
WHERE c.company_code = l.company_code AND 
      l.lead_manager_code = s.lead_manager_code AND
      s.senior_manager_code = m.senior_manager_code AND
      m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder ORDER BY c.company_code;

/*

We can join all tables with company_code, lead_manager_code, senior_manager_code, manager_code and employee_code.
We can use “SELECT from tb1, tb2, … WHERE” to join tables. And we can use “JOIN … ON …” to join tables one by one as well.
Also,

number of employees and various managers ==> COUNT(…) GROUP BY …
table may contain duplicates ==> COUNT(DISTINCT …) GROUP BY …
order output by ascending company_code ==> ORDER BY c.company_code
*/
