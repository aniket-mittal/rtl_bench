module rtlpp_05288
  (input wire [48:0] ir,
   input wire	     idebug,
   input wire	     iwrited,
   input wire	     nop,
   output wire [3:0] funct,
   output wire	     dest,


   output wire	     div,
   output wire	     imod,
   output wire	     iralu,
   output wire	     irbyte,
   output wire	     irdisp,
   output wire	     irjump,
   output wire	     mul,

   
   output wire	     destlc,	 
   output wire	     destintctl, 
   output wire	     destpdltop, 
   output wire	     destpdl_p,	 
   output wire	     destpdl_x,	 
   output wire	     destpdlx,	 
   output wire	     destpdlp,	 
   output wire	     destspc,	 
   output wire	     destimod0,	 
   output wire	     destimod1,	 
   output wire	     destvma,	 
   output wire	     destmdr,	 
   output wire	     destmem, 
   output wire	     destm, 

   
   output wire	     srcdc,   
   output wire	     srcspc,  
   output wire	     srcpdlptr, 
   output wire	     srcpdlidx, 
   output wire	     srcpdltop, 
   output wire	     srcopc,	
   output wire	     srcq,	
   output wire	     srcvma,	
   output wire	     srcmap,	
   output wire	     srcmd,	
   output wire	     srclc,	
   output wire	     srcspcpop, 
   output wire	     srcpdlpop, 

   input wire	     clk,
   input wire	     reset);

   wire		     specalu;

   

   assign {irbyte, irdisp, irjump, iralu}
     = nop ? 4'b0000 :
       ({ir[44], ir[43]} == 2'b00) ? 4'b0001 :
       ({ir[44], ir[43]} == 2'b01) ? 4'b0010 :
       ({ir[44], ir[43]} == 2'b10) ? 4'b0100 :
       4'b1000 ;
   assign funct
     = nop ? 4'b0000 :
       ({ir[11], ir[10]} == 2'b00) ? 4'b0001 :
       ({ir[11], ir[10]} == 2'b01) ? 4'b0010 :
       ({ir[11], ir[10]} == 2'b10) ? 4'b0100 :
       4'b1000 ;
   assign specalu = ir[8] & iralu;
   assign {div, mul}
     = ~specalu ? 2'b00 :
       ({ir[4], ir[3]} == 2'b00) ? 2'b01 :
       2'b10;
   assign {srcq, srcopc, srcpdltop, srcpdlpop, srcpdlidx, srcpdlptr, srcspc, srcdc}
     = (~ir[31] | ir[29]) ? 8'b00000000 :
       ({ir[28], ir[27], ir[26]} == 3'b000) ? 8'b00000001 :
       ({ir[28], ir[27], ir[26]} == 3'b001) ? 8'b00000010 :
       ({ir[28], ir[27], ir[26]} == 3'b010) ? 8'b00000100 :
       ({ir[28], ir[27], ir[26]} == 3'b011) ? 8'b00001000 :
       ({ir[28], ir[27], ir[26]} == 3'b100) ? 8'b00010000 :
       ({ir[28], ir[27], ir[26]} == 3'b101) ? 8'b00100000 :
       ({ir[28], ir[27], ir[26]} == 3'b110) ? 8'b01000000 :
       8'b10000000;
   assign {srcspcpop, srclc, srcmd, srcmap, srcvma}
     = (~ir[31] | ~ir[29]) ? 5'b00000 :
       ({ir[28], ir[27], ir[26]} == 3'b000) ? 5'b00001 :
       ({ir[28], ir[27], ir[26]} == 3'b001) ? 5'b00010 :
       ({ir[28], ir[27], ir[26]} == 3'b010) ? 5'b00100 :
       ({ir[28], ir[27], ir[26]} == 3'b011) ? 5'b01000 :
       ({ir[28], ir[27], ir[26]} == 3'b100) ? 5'b10000 :
       5'b00000 ;
   assign imod = destimod0 | destimod1 | iwrited | idebug;
   assign destmem = destm & ir[23];
   assign destvma = destmem & ~ir[22];
   assign destmdr = destmem & ir[22];
   assign dest = iralu | irbyte;
   assign destm = dest & ~ir[25];
   assign {destintctl, destlc}
     = !(destm & ~ir[23] & ~ir[22]) ? 2'b00 :
       ({ir[21], ir[20], ir[19]} == 3'b001) ? 2'b01 :
       ({ir[21], ir[20], ir[19]} == 3'b010) ? 2'b10 :
       2'b00 ;
   assign {destimod1, destimod0, destspc, destpdlp, destpdlx, destpdl_x, destpdl_p, destpdltop}
     = !(destm & ~ir[23] & ir[22]) ? 8'b00000000 :
       ({ir[21], ir[20], ir[19]} == 3'b000) ? 8'b00000001 :
       ({ir[21], ir[20], ir[19]} == 3'b001) ? 8'b00000010 :
       ({ir[21], ir[20], ir[19]} == 3'b010) ? 8'b00000100 :
       ({ir[21], ir[20], ir[19]} == 3'b011) ? 8'b00001000 :
       ({ir[21], ir[20], ir[19]} == 3'b100) ? 8'b00010000 :
       ({ir[21], ir[20], ir[19]} == 3'b101) ? 8'b00100000 :
       ({ir[21], ir[20], ir[19]} == 3'b110) ? 8'b01000000 :
       ({ir[21], ir[20], ir[19]} == 3'b111) ? 8'b10000000 :
       8'b00000000;

endmodule