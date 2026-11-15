// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01846 dut (
    .a_i(in_vec[15:8]),
    .b_i(in_vec[7:0]),
    .c_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h30ed;
    stim[1] = 16'h7f42;
    stim[2] = 16'h5a21;
    stim[3] = 16'he4ad;
    stim[4] = 16'h711f;
    stim[5] = 16'h1b23;
    stim[6] = 16'h6da2;
    stim[7] = 16'h6ead;
    stim[8] = 16'h9c94;
    stim[9] = 16'h3897;
    stim[10] = 16'h8ba5;
    stim[11] = 16'hb63d;
    stim[12] = 16'ha4cc;
    stim[13] = 16'h466e;
    stim[14] = 16'haf53;
    stim[15] = 16'h82aa;
    stim[16] = 16'hf112;
    stim[17] = 16'h50b0;
    stim[18] = 16'h46ae;
    stim[19] = 16'h3bcb;
    stim[20] = 16'h5b63;
    stim[21] = 16'h191f;
    stim[22] = 16'h0a5f;
    stim[23] = 16'h55a2;
    stim[24] = 16'hf27b;
    stim[25] = 16'h9ff0;
    stim[26] = 16'h1873;
    stim[27] = 16'hc20f;
    stim[28] = 16'hd9e6;
    stim[29] = 16'hd32b;
    stim[30] = 16'h09ed;
    stim[31] = 16'he154;
    stim[32] = 16'h3110;
    stim[33] = 16'ha52d;
    stim[34] = 16'h6ca3;
    stim[35] = 16'hf661;
    stim[36] = 16'h9f6a;
    stim[37] = 16'h7930;
    stim[38] = 16'h131e;
    stim[39] = 16'h9b84;
    stim[40] = 16'h2763;
    stim[41] = 16'hb662;
    stim[42] = 16'hfcb0;
    stim[43] = 16'h4b62;
    stim[44] = 16'h4763;
    stim[45] = 16'haf9c;
    stim[46] = 16'h634a;
    stim[47] = 16'h532f;
    stim[48] = 16'hca17;
    stim[49] = 16'hbbb1;
    stim[50] = 16'h031b;
    stim[51] = 16'hb41f;
    stim[52] = 16'h6a0c;
    stim[53] = 16'h2f1b;
    stim[54] = 16'h0464;
    stim[55] = 16'heed9;
    stim[56] = 16'hde52;
    stim[57] = 16'h3c62;
    stim[58] = 16'hdf52;
    stim[59] = 16'h11ea;
    stim[60] = 16'hc084;
    stim[61] = 16'h4673;
    stim[62] = 16'h7ac3;
    stim[63] = 16'h6f8c;
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
      expv[0] = 8'h20;
      expv[1] = 8'h42;
      expv[2] = 8'h00;
      expv[3] = 8'ha4;
      expv[4] = 8'h11;
      expv[5] = 8'h03;
      expv[6] = 8'h20;
      expv[7] = 8'h2c;
      expv[8] = 8'h94;
      expv[9] = 8'h10;
      expv[10] = 8'h81;
      expv[11] = 8'h34;
      expv[12] = 8'h84;
      expv[13] = 8'h46;
      expv[14] = 8'h03;
      expv[15] = 8'h82;
      expv[16] = 8'h10;
      expv[17] = 8'h10;
      expv[18] = 8'h06;
      expv[19] = 8'h0b;
      expv[20] = 8'h43;
      expv[21] = 8'h19;
      expv[22] = 8'h0a;
      expv[23] = 8'h00;
      expv[24] = 8'h72;
      expv[25] = 8'h90;
      expv[26] = 8'h10;
      expv[27] = 8'h02;
      expv[28] = 8'hc0;
      expv[29] = 8'h03;
      expv[30] = 8'h09;
      expv[31] = 8'h40;
      expv[32] = 8'h10;
      expv[33] = 8'h25;
      expv[34] = 8'h20;
      expv[35] = 8'h60;
      expv[36] = 8'h0a;
      expv[37] = 8'h30;
      expv[38] = 8'h12;
      expv[39] = 8'h80;
      expv[40] = 8'h23;
      expv[41] = 8'h22;
      expv[42] = 8'hb0;
      expv[43] = 8'h42;
      expv[44] = 8'h43;
      expv[45] = 8'h8c;
      expv[46] = 8'h42;
      expv[47] = 8'h03;
      expv[48] = 8'h02;
      expv[49] = 8'hb1;
      expv[50] = 8'h03;
      expv[51] = 8'h14;
      expv[52] = 8'h08;
      expv[53] = 8'h0b;
      expv[54] = 8'h04;
      expv[55] = 8'hc8;
      expv[56] = 8'h52;
      expv[57] = 8'h20;
      expv[58] = 8'h52;
      expv[59] = 8'h00;
      expv[60] = 8'h80;
      expv[61] = 8'h42;
      expv[62] = 8'h42;
      expv[63] = 8'h0c;
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
