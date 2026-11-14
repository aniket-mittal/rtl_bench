// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  div_16bit dut (
    .A(in_vec[23:8]),
    .B(in_vec[7:0]),
    .result(out_vec[31:16]),
    .odd(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h094f0e;
    stim[1] = 24'hbce865;
    stim[2] = 24'h15b668;
    stim[3] = 24'h6a76a6;
    stim[4] = 24'h8b9899;
    stim[5] = 24'h4db0ee;
    stim[6] = 24'h45c40a;
    stim[7] = 24'hb0f091;
    stim[8] = 24'h1baa3d;
    stim[9] = 24'he83134;
    stim[10] = 24'h181c1f;
    stim[11] = 24'hab3d38;
    stim[12] = 24'ha3e0b5;
    stim[13] = 24'h5b1610;
    stim[14] = 24'had0d1a;
    stim[15] = 24'h7b63f3;
    stim[16] = 24'h2aee5d;
    stim[17] = 24'hb1e0cb;
    stim[18] = 24'h1db4b6;
    stim[19] = 24'h8ec6cd;
    stim[20] = 24'hc3aaed;
    stim[21] = 24'h135d02;
    stim[22] = 24'ha7e1e4;
    stim[23] = 24'he19c5e;
    stim[24] = 24'h0c082c;
    stim[25] = 24'hb51323;
    stim[26] = 24'hf11f60;
    stim[27] = 24'h2a9842;
    stim[28] = 24'h7cfccb;
    stim[29] = 24'h1427c8;
    stim[30] = 24'hd8ce35;
    stim[31] = 24'h91cf5c;
    stim[32] = 24'ha1add6;
    stim[33] = 24'hf742f1;
    stim[34] = 24'h8f2a1d;
    stim[35] = 24'h2675f0;
    stim[36] = 24'hafff0d;
    stim[37] = 24'hf87091;
    stim[38] = 24'hd40f96;
    stim[39] = 24'h6dbf26;
    stim[40] = 24'ha02131;
    stim[41] = 24'heaae13;
    stim[42] = 24'h4400a5;
    stim[43] = 24'hd333d2;
    stim[44] = 24'h122298;
    stim[45] = 24'h7609a3;
    stim[46] = 24'hf0d2cb;
    stim[47] = 24'h687ded;
    stim[48] = 24'h76f785;
    stim[49] = 24'h7513de;
    stim[50] = 24'h13770a;
    stim[51] = 24'h4dc455;
    stim[52] = 24'h3f7f16;
    stim[53] = 24'h0abb8c;
    stim[54] = 24'hd0c907;
    stim[55] = 24'hb702bd;
    stim[56] = 24'h125c14;
    stim[57] = 24'hf890f9;
    stim[58] = 24'hf07117;
    stim[59] = 24'hffc4ae;
    stim[60] = 24'hdf57eb;
    stim[61] = 24'h7f9b9e;
    stim[62] = 24'h57e191;
    stim[63] = 24'h0da33b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h00aa0003;
      expv[1] = 32'h01de0052;
      expv[2] = 32'h0035002e;
      expv[3] = 32'h00a4001e;
      expv[4] = 32'h00e90057;
      expv[5] = 32'h00530086;
      expv[6] = 32'h06fa0000;
      expv[7] = 32'h01380038;
      expv[8] = 32'h00740006;
      expv[9] = 32'h04770005;
      expv[10] = 32'h00c70003;
      expv[11] = 32'h030e002d;
      expv[12] = 32'h00e7008d;
      expv[13] = 32'h05b10006;
      expv[14] = 32'h06a70017;
      expv[15] = 32'h008100f0;
      expv[16] = 32'h00760010;
      expv[17] = 32'h00e00040;
      expv[18] = 32'h0029008e;
      expv[19] = 32'h00b2003c;
      expv[20] = 32'h00d30053;
      expv[21] = 32'h09ae0001;
      expv[22] = 32'h00bc0071;
      expv[23] = 32'h02660028;
      expv[24] = 32'h00460000;
      expv[25] = 32'h052c000f;
      expv[26] = 32'h0282005f;
      expv[27] = 32'h00a5000e;
      expv[28] = 32'h009d007d;
      expv[29] = 32'h0019009f;
      expv[30] = 32'h0417000b;
      expv[31] = 32'h01950043;
      expv[32] = 32'h00c10057;
      expv[33] = 32'h0106009c;
      expv[34] = 32'h04ef0017;
      expv[35] = 32'h00290005;
      expv[36] = 32'h0d89000a;
      expv[37] = 32'h01b6005a;
      expv[38] = 32'h01690089;
      expv[39] = 32'h02e3000d;
      expv[40] = 32'h0344001d;
      expv[41] = 32'h0c5a0000;
      expv[42] = 32'h00690053;
      expv[43] = 32'h01010061;
      expv[44] = 32'h001e0052;
      expv[45] = 32'h00b9003e;
      expv[46] = 32'h012f008d;
      expv[47] = 32'h007000cd;
      expv[48] = 32'h00e40083;
      expv[49] = 32'h00870001;
      expv[50] = 32'h01f20003;
      expv[51] = 32'h00ea0012;
      expv[52] = 32'h02e20013;
      expv[53] = 32'h00130057;
      expv[54] = 32'h1dd30004;
      expv[55] = 32'h00f700a7;
      expv[56] = 32'h00eb0000;
      expv[57] = 32'h00ff0089;
      expv[58] = 32'h0a740005;
      expv[59] = 32'h01780034;
      expv[60] = 32'h00f30046;
      expv[61] = 32'h00ce0077;
      expv[62] = 32'h009b0016;
      expv[63] = 32'h003b000a;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
