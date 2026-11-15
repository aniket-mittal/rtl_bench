module rtlpp_02633(
    input [3:0] bcd, 
    output [6:0] to7Seg
);

   wire XLXN_87;
   wire XLXN_91;
   wire XLXN_92;
   wire XLXN_97;
   wire XLXN_101;
   wire XLXN_104;
   wire XLXN_106;
   wire XLXN_107;
   wire XLXN_108;
   wire XLXN_111;
   wire XLXN_113;
   wire XLXN_114;
   
   // Inverters
   assign XLXN_87 = ~bcd[2];
   assign XLXN_91 = ~bcd[0];
   assign XLXN_92 = ~bcd[1];
   
   // AND gates
   assign XLXN_104 = bcd[1] & XLXN_87;
   assign XLXN_107 = XLXN_91 & XLXN_87;
   assign XLXN_113 = XLXN_92 & bcd[2];
   assign XLXN_106 = XLXN_113 & bcd[0];
   assign XLXN_97 = bcd[0] & bcd[2];
   assign XLXN_114 = XLXN_91 & bcd[2];
   assign XLXN_111 = XLXN_91 & XLXN_92;
   assign XLXN_101 = bcd[0] & bcd[1];
   assign XLXN_108 = XLXN_91 & bcd[1];
   
   // OR gates
   assign to7Seg[0] = XLXN_107 | XLXN_97 | bcd[1] | bcd[3];
   assign to7Seg[1] = XLXN_111 | XLXN_101 | XLXN_87;
   assign to7Seg[2] = bcd[0] | XLXN_92 | bcd[2];
   assign to7Seg[3] = XLXN_106 | XLXN_108 | XLXN_107 | XLXN_104 | bcd[3];
   assign to7Seg[4] = XLXN_108 | XLXN_107;
   assign to7Seg[5] = XLXN_111 | XLXN_113 | XLXN_114 | bcd[3];
   assign to7Seg[6] = XLXN_114 | XLXN_104 | XLXN_113 | bcd[3];

endmodule