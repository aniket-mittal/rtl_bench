module tarb ( ngnt, ntgnt, req, treq );

   input [1:0] req;		
   output [1:0] ngnt;		
   output treq;			
   input ntgnt;			
  
   wire  n1, n2;		
   wire [1:0] mgnt;		

   wire a, b, qbn, qb, qan, qa;

   nand u1_mu (qan, req[0], qbn); 
   nor  u2_mu (qb, qbn, qbn, qbn); 
   nor  u3_mu (qa, qan, qan, qan); 
   nand u4_mu (qbn, req[1], qan);

   assign mgnt[0] = qa;
   assign mgnt[1] = qb;

   wire c2na_q, c2nb_q;
   and c2na_u1 (c2na_m, ntgnt, c2na_q);
   or  c2na_u2 (ngnt[0], c2na_m, n2);

   and c2nb_u1 (c2nb_m, ntgnt, c2nb_q);
   or  c2nb_u2 (ngnt[1], c2nb_m, n1);

   nand u1 (treq, n1, n2);
   nand u2 (n1, ngnt[0], mgnt[1]);
   nand u3 (n2, ngnt[1], mgnt[0]);
endmodule