module zet_mux8_16(sel, in0, in1, in2, in3, in4, in5, in6, in7, out);
  input  [2:0]  sel;
  input  [15:0] in0, in1, in2, in3, in4, in5, in6, in7;
  output [15:0] out;

  reg    [15:0] out;

  always @(sel or in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7)
    case(sel)
     3'd0:  out = in0;
     3'd1:  out = in1;
     3'd2:  out = in2;
     3'd3:  out = in3;
     3'd4:  out = in4;
     3'd5:  out = in5;
     3'd6:  out = in6;
     3'd7:  out = in7;
    endcase
endmodule

module zet_othop (x, y, seg, off, iflags, func, word_op, out, oflags);
  // IO ports
  input [15:0] x, y, off, seg, iflags;
  input [2:0] func;
  input word_op;
  output [19:0] out;
  output [8:0] oflags;

  // Net declarations
  wire [15:0] deff, deff2, outf, clcm, setf, intf, strf;
  wire [19:0] dcmp, dcmp2; 
  wire dfi;

  // Module instantiations
  zet_mux8_16 mux8_16 (func, dcmp[15:0], dcmp2[15:0], deff, outf, clcm, setf, 
                       intf, strf, out[15:0]);
  assign out[19:16] = func ? dcmp2[19:16] : dcmp[19:16];

  // Assignments
  assign dcmp  = (seg << 4) + deff;
  assign dcmp2 = (seg << 4) + deff2;
  assign deff  = x + y + off;
  assign deff2 = x + y + off + 16'd2;
  assign outf  = y;
  assign clcm  = y[2] ? (y[1] ? /* -1: clc */ {iflags[15:1], 1'b0} 
                         : /* 4: cld */ {iflags[15:11], 1'b0, iflags[9:0]})
                     : (y[1] ? /* 2: cli */ {iflags[15:10], 1'b0, iflags[8:0]}
                       : /* 0: cmc */ {iflags[15:1], ~iflags[0]});
  assign setf  = y[2] ? (y[1] ? /* -1: stc */ {iflags[15:1], 1'b1} 
                         : /* 4: std */ {iflags[15:11], 1'b1, iflags[9:0]})
                     : (y[1] ? /* 2: sti */ {iflags[15:10], 1'b1, iflags[8:0]}
                       : /* 0: outf */ iflags);

  assign intf = {iflags[15:10], 2'b0, iflags[7:0]};
  assign dfi  = iflags[10];
  assign strf = dfi ? (x - y) : (x + y);

  assign oflags = word_op ? { out[11:6], out[4], out[2], out[0] }
                           : { iflags[11:8], out[7:6], out[4], out[2], out[0] };
endmodule