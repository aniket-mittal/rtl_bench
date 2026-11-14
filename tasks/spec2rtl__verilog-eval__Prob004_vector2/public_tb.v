// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h409188ba;
    stim[1] = 32'hb4cc28fd;
    stim[2] = 32'h01720afa;
    stim[3] = 32'h10e1478a;
    stim[4] = 32'h902934b6;
    stim[5] = 32'h84c45390;
    stim[6] = 32'h18f1b6b2;
    stim[7] = 32'h8e99147a;
    stim[8] = 32'h458dd84e;
    stim[9] = 32'hb79d9ea2;
    stim[10] = 32'h9e1c9575;
    stim[11] = 32'h41b67842;
    stim[12] = 32'h78b6f600;
    stim[13] = 32'h5b792ca6;
    stim[14] = 32'h4fbef50b;
    stim[15] = 32'hf501fed6;
    stim[16] = 32'ha57687d6;
    stim[17] = 32'hba419f2f;
    stim[18] = 32'hf089158c;
    stim[19] = 32'h3cdda411;
    stim[20] = 32'h8bd7d34a;
    stim[21] = 32'h69a98e2b;
    stim[22] = 32'h4f799bbd;
    stim[23] = 32'h7098901e;
    stim[24] = 32'h9ae6a08f;
    stim[25] = 32'hcfd156d5;
    stim[26] = 32'hc37dce60;
    stim[27] = 32'h791cadae;
    stim[28] = 32'h7c1a8d59;
    stim[29] = 32'h2aed7645;
    stim[30] = 32'h20bd677b;
    stim[31] = 32'hdd756885;
    stim[32] = 32'h332a1d78;
    stim[33] = 32'hc5008bea;
    stim[34] = 32'hbdf0690b;
    stim[35] = 32'h467a8f75;
    stim[36] = 32'h409093aa;
    stim[37] = 32'h58981770;
    stim[38] = 32'h09fe5702;
    stim[39] = 32'h526266c5;
    stim[40] = 32'h03b60946;
    stim[41] = 32'ha31c88c5;
    stim[42] = 32'hc0feb993;
    stim[43] = 32'h11e0d8bf;
    stim[44] = 32'h39db22bc;
    stim[45] = 32'h103cd3ac;
    stim[46] = 32'h47abeaec;
    stim[47] = 32'h06a0582b;
    stim[48] = 32'h08cfb798;
    stim[49] = 32'hacf7465d;
    stim[50] = 32'h61c8b42d;
    stim[51] = 32'h0159aecb;
    stim[52] = 32'hf61a3550;
    stim[53] = 32'h128f642c;
    stim[54] = 32'h3f8b53bb;
    stim[55] = 32'hacdae01a;
    stim[56] = 32'hec96ed09;
    stim[57] = 32'hc7eeeaa0;
    stim[58] = 32'h846352ea;
    stim[59] = 32'h4f864633;
    stim[60] = 32'h2c1f8844;
    stim[61] = 32'h2198a002;
    stim[62] = 32'hc6654520;
    stim[63] = 32'hd1dd7b70;
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
      expv[0] = 32'hba889140;
      expv[1] = 32'hfd28ccb4;
      expv[2] = 32'hfa0a7201;
      expv[3] = 32'h8a47e110;
      expv[4] = 32'hb6342990;
      expv[5] = 32'h9053c484;
      expv[6] = 32'hb2b6f118;
      expv[7] = 32'h7a14998e;
      expv[8] = 32'h4ed88d45;
      expv[9] = 32'ha29e9db7;
      expv[10] = 32'h75951c9e;
      expv[11] = 32'h4278b641;
      expv[12] = 32'h00f6b678;
      expv[13] = 32'ha62c795b;
      expv[14] = 32'h0bf5be4f;
      expv[15] = 32'hd6fe01f5;
      expv[16] = 32'hd68776a5;
      expv[17] = 32'h2f9f41ba;
      expv[18] = 32'h8c1589f0;
      expv[19] = 32'h11a4dd3c;
      expv[20] = 32'h4ad3d78b;
      expv[21] = 32'h2b8ea969;
      expv[22] = 32'hbd9b794f;
      expv[23] = 32'h1e909870;
      expv[24] = 32'h8fa0e69a;
      expv[25] = 32'hd556d1cf;
      expv[26] = 32'h60ce7dc3;
      expv[27] = 32'haead1c79;
      expv[28] = 32'h598d1a7c;
      expv[29] = 32'h4576ed2a;
      expv[30] = 32'h7b67bd20;
      expv[31] = 32'h856875dd;
      expv[32] = 32'h781d2a33;
      expv[33] = 32'hea8b00c5;
      expv[34] = 32'h0b69f0bd;
      expv[35] = 32'h758f7a46;
      expv[36] = 32'haa939040;
      expv[37] = 32'h70179858;
      expv[38] = 32'h0257fe09;
      expv[39] = 32'hc5666252;
      expv[40] = 32'h4609b603;
      expv[41] = 32'hc5881ca3;
      expv[42] = 32'h93b9fec0;
      expv[43] = 32'hbfd8e011;
      expv[44] = 32'hbc22db39;
      expv[45] = 32'hacd33c10;
      expv[46] = 32'heceaab47;
      expv[47] = 32'h2b58a006;
      expv[48] = 32'h98b7cf08;
      expv[49] = 32'h5d46f7ac;
      expv[50] = 32'h2db4c861;
      expv[51] = 32'hcbae5901;
      expv[52] = 32'h50351af6;
      expv[53] = 32'h2c648f12;
      expv[54] = 32'hbb538b3f;
      expv[55] = 32'h1ae0daac;
      expv[56] = 32'h09ed96ec;
      expv[57] = 32'ha0eaeec7;
      expv[58] = 32'hea526384;
      expv[59] = 32'h3346864f;
      expv[60] = 32'h44881f2c;
      expv[61] = 32'h02a09821;
      expv[62] = 32'h204565c6;
      expv[63] = 32'h707bddd1;
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
