// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  xpm_fifo_axi_reg_slice dut (
    .ACLK(clk),
    .ARESET(in_vec[34:34]),
    .S_PAYLOAD_DATA(in_vec[33:2]),
    .S_VALID(in_vec[1:1]),
    .M_READY(in_vec[0:0]),
    .S_READY(out_vec[33:33]),
    .M_PAYLOAD_DATA(out_vec[32:1]),
    .M_VALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h68d24e893;
    stim[1] = 35'h7a7d3e311;
    stim[2] = 35'h05ae3f08e;
    stim[3] = 35'h3c8925e66;
    stim[4] = 35'h2ab2f8a48;
    stim[5] = 35'h2e8d71207;
    stim[6] = 35'h363f5aa74;
    stim[7] = 35'h2ad949216;
    stim[8] = 35'h3f09585ae;
    stim[9] = 35'h2ab61388c;
    stim[10] = 35'h28d2d6b36;
    stim[11] = 35'h2f6fb7778;
    stim[12] = 35'h0e53cdb18;
    stim[13] = 35'h079e1a135;
    stim[14] = 35'h122ffb0cb;
    stim[15] = 35'h023316563;
    stim[16] = 35'h358292f89;
    stim[17] = 35'h1c51191fe;
    stim[18] = 35'h1c8e18175;
    stim[19] = 35'h3502259ce;
    stim[20] = 35'h1eea323c5;
    stim[21] = 35'h1588d96c7;
    stim[22] = 35'h3f7b634d6;
    stim[23] = 35'h37726a3f6;
    stim[24] = 35'h23a67f61b;
    stim[25] = 35'h11121f83c;
    stim[26] = 35'h13ce6ae22;
    stim[27] = 35'h281a1402c;
    stim[28] = 35'h17bfd1106;
    stim[29] = 35'h3c2a0d723;
    stim[30] = 35'h34dd529bc;
    stim[31] = 35'h26ca20ce8;
    stim[32] = 35'h08d3298d0;
    stim[33] = 35'h3c27e63c3;
    stim[34] = 35'h1736a0020;
    stim[35] = 35'h39a4d770a;
    stim[36] = 35'h1a2f6cf39;
    stim[37] = 35'h01617828d;
    stim[38] = 35'h24447b29d;
    stim[39] = 35'h252bf949c;
    stim[40] = 35'h09d5aa113;
    stim[41] = 35'h016910227;
    stim[42] = 35'h163df5cc1;
    stim[43] = 35'h2e3ab63ab;
    stim[44] = 35'h292524564;
    stim[45] = 35'h20d96cb4a;
    stim[46] = 35'h161170bc5;
    stim[47] = 35'h2a45eab9a;
    stim[48] = 35'h12aeafaf0;
    stim[49] = 35'h361735fda;
    stim[50] = 35'h37d6632ea;
    stim[51] = 35'h3114776d4;
    stim[52] = 35'h20f7d943b;
    stim[53] = 35'h1ddcd30f0;
    stim[54] = 35'h1df4ccd1c;
    stim[55] = 35'h2de49583d;
    stim[56] = 35'h0238d1273;
    stim[57] = 35'h11f04d06f;
    stim[58] = 35'h2aa2f4003;
    stim[59] = 35'h18bd7d2f4;
    stim[60] = 35'h100e9a039;
    stim[61] = 35'h192f4b768;
    stim[62] = 35'h1be6ced66;
    stim[63] = 35'h09bc59dbc;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 34'hx0000000x;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h02d71f846;
      expv[4] = 34'h1e4492f32;
      expv[5] = 34'h1e4492f32;
      expv[6] = 34'h1746b8902;
      expv[7] = 34'h1746b8902;
      expv[8] = 34'h156ca490a;
      expv[9] = 34'h1f84ac2d6;
      expv[10] = 34'h1f84ac2d6;
      expv[11] = 34'h34696b59a;
      expv[12] = 34'h34696b59a;
      expv[13] = 34'h34696b59a;
      expv[14] = 34'h34696b59a;
      expv[15] = 34'h2917fd865;
      expv[16] = 34'h21198b2b1;
      expv[17] = 34'h21198b2b0;
      expv[18] = 34'h2e288c8ff;
      expv[19] = 34'h2e288c8fe;
      expv[20] = 34'h3a8112ce7;
      expv[21] = 34'h3a8112ce6;
      expv[22] = 34'h2ac46cb63;
      expv[23] = 34'h0ac46cb63;
      expv[24] = 34'h0ac46cb63;
      expv[25] = 34'h3fbdb1a6b;
      expv[26] = 34'h3fbdb1a6b;
      expv[27] = 34'h1fbdb1a6b;
      expv[28] = 34'h1fbdb1a6b;
      expv[29] = 34'h1fbdb1a6b;
      expv[30] = 34'h29e735711;
      expv[31] = 34'h29e735711;
      expv[32] = 34'h29e735711;
      expv[33] = 34'h29e735711;
      expv[34] = 34'h3e13f31e1;
      expv[35] = 34'h3e13f31e1;
      expv[36] = 34'h1e13f31e1;
      expv[37] = 34'h3cd26bb85;
      expv[38] = 34'h3cd26bb84;
      expv[39] = 34'h3cd26bb84;
      expv[40] = 34'h3cd26bb84;
      expv[41] = 34'h24ead5089;
      expv[42] = 34'h20b488113;
      expv[43] = 34'h20b488112;
      expv[44] = 34'h371d5b1d5;
      expv[45] = 34'h371d5b1d5;
      expv[46] = 34'h171d5b1d5;
      expv[47] = 34'h306cb65a5;
      expv[48] = 34'h106cb65a5;
      expv[49] = 34'h106cb65a5;
      expv[50] = 34'h106cb65a5;
      expv[51] = 34'h106cb65a5;
      expv[52] = 34'h106cb65a5;
      expv[53] = 34'h3522f55cd;
      expv[54] = 34'h3522f55cd;
      expv[55] = 34'h3522f55cd;
      expv[56] = 34'h3522f55cc;
      expv[57] = 34'h211c68939;
      expv[58] = 34'h28f826837;
      expv[59] = 34'h35517a001;
      expv[60] = 34'h35517a001;
      expv[61] = 34'h35517a000;
      expv[62] = 34'h35517a000;
      expv[63] = 34'h2df3676b3;
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
