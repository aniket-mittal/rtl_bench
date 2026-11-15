// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028433 dut (
    .clk_i(clk),
    .rst_n_i(in_vec[34:34]),
    .data_i(in_vec[33:2]),
    .rd_i(in_vec[1:1]),
    .wr_i(in_vec[0:0]),
    .full_o(out_vec[40:40]),
    .empty_o(out_vec[39:39]),
    .overflow_o(out_vec[38:38]),
    .data_o(out_vec[37:6]),
    .freeslot_o(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h412bf254f;
    stim[1] = 35'h74c7774cf;
    stim[2] = 35'h3e94ce7fe;
    stim[3] = 35'h053bdf614;
    stim[4] = 35'h22200521d;
    stim[5] = 35'h22b571a8a;
    stim[6] = 35'h3a4674662;
    stim[7] = 35'h0a384c6da;
    stim[8] = 35'h0e055bc33;
    stim[9] = 35'h249b8291a;
    stim[10] = 35'h20a9257d8;
    stim[11] = 35'h2af679d61;
    stim[12] = 35'h3e8c46bf9;
    stim[13] = 35'h22e92a6af;
    stim[14] = 35'h04d137737;
    stim[15] = 35'h07404c982;
    stim[16] = 35'h39eb4923e;
    stim[17] = 35'h2841cedf4;
    stim[18] = 35'h21f546ba1;
    stim[19] = 35'h0c9075cf5;
    stim[20] = 35'h1231d228c;
    stim[21] = 35'h0136a5f9a;
    stim[22] = 35'h0f9d8fd23;
    stim[23] = 35'h141411e5b;
    stim[24] = 35'h2cb8ed92b;
    stim[25] = 35'h3e3132340;
    stim[26] = 35'h25eed47dc;
    stim[27] = 35'h3fe0b2509;
    stim[28] = 35'h336a801aa;
    stim[29] = 35'h2292dff7d;
    stim[30] = 35'h2e7251639;
    stim[31] = 35'h2d323e80c;
    stim[32] = 35'h11e854e5b;
    stim[33] = 35'h1ca010c2a;
    stim[34] = 35'h3cfc010b2;
    stim[35] = 35'h196fb9050;
    stim[36] = 35'h24ebea908;
    stim[37] = 35'h03a96f325;
    stim[38] = 35'h0fb3c96cc;
    stim[39] = 35'h010d33856;
    stim[40] = 35'h34428fe24;
    stim[41] = 35'h33b676660;
    stim[42] = 35'h1e27db626;
    stim[43] = 35'h0e14473d3;
    stim[44] = 35'h1c7b62651;
    stim[45] = 35'h2d9bd2417;
    stim[46] = 35'h258615a17;
    stim[47] = 35'h37c6bcd2e;
    stim[48] = 35'h0a73ee39f;
    stim[49] = 35'h11e1a81e0;
    stim[50] = 35'h1a8f3c9dd;
    stim[51] = 35'h3dfb2c3ac;
    stim[52] = 35'h276b26ca9;
    stim[53] = 35'h2bfe52ac5;
    stim[54] = 35'h3706e5ca7;
    stim[55] = 35'h19276b52b;
    stim[56] = 35'h2dbe41b38;
    stim[57] = 35'h222c18a91;
    stim[58] = 35'h0a3f4a606;
    stim[59] = 35'h20d797a22;
    stim[60] = 35'h158f4f9a9;
    stim[61] = 35'h36a3ff978;
    stim[62] = 35'h2780771f6;
    stim[63] = 35'h1c5c45295;
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
      expv[0] = 41'h0xxxxxxxxx0;
      expv[1] = 41'h0012bf254df;
      expv[2] = 41'h0812bf254e0;
      expv[3] = 41'h0812bf254e0;
      expv[4] = 41'h0812bf254e0;
      expv[5] = 41'h0812bf254e0;
      expv[6] = 41'h0812bf254e0;
      expv[7] = 41'h0812bf254e0;
      expv[8] = 41'h0812bf254e0;
      expv[9] = 41'h0812bf254e0;
      expv[10] = 41'h0812bf254e0;
      expv[11] = 41'h0812bf254e0;
      expv[12] = 41'h0812bf254e0;
      expv[13] = 41'h0812bf254e0;
      expv[14] = 41'h0812bf254e0;
      expv[15] = 41'h0812bf254e0;
      expv[16] = 41'h0812bf254e0;
      expv[17] = 41'h0812bf254e0;
      expv[18] = 41'h0812bf254e0;
      expv[19] = 41'h0812bf254e0;
      expv[20] = 41'h0812bf254e0;
      expv[21] = 41'h0812bf254e0;
      expv[22] = 41'h0812bf254e0;
      expv[23] = 41'h0812bf254e0;
      expv[24] = 41'h0812bf254e0;
      expv[25] = 41'h0812bf254e0;
      expv[26] = 41'h0812bf254e0;
      expv[27] = 41'h0812bf254e0;
      expv[28] = 41'h0812bf254e0;
      expv[29] = 41'h0812bf254e0;
      expv[30] = 41'h0812bf254e0;
      expv[31] = 41'h0812bf254e0;
      expv[32] = 41'h0812bf254e0;
      expv[33] = 41'h0812bf254e0;
      expv[34] = 41'h0812bf254e0;
      expv[35] = 41'h0812bf254e0;
      expv[36] = 41'h0812bf254e0;
      expv[37] = 41'h0812bf254e0;
      expv[38] = 41'h0812bf254e0;
      expv[39] = 41'h0812bf254e0;
      expv[40] = 41'h0812bf254e0;
      expv[41] = 41'h0812bf254e0;
      expv[42] = 41'h0812bf254e0;
      expv[43] = 41'h0812bf254e0;
      expv[44] = 41'h0812bf254e0;
      expv[45] = 41'h0812bf254e0;
      expv[46] = 41'h0812bf254e0;
      expv[47] = 41'h0812bf254e0;
      expv[48] = 41'h0812bf254e0;
      expv[49] = 41'h0812bf254e0;
      expv[50] = 41'h0812bf254e0;
      expv[51] = 41'h0812bf254e0;
      expv[52] = 41'h0812bf254e0;
      expv[53] = 41'h0812bf254e0;
      expv[54] = 41'h0812bf254e0;
      expv[55] = 41'h0812bf254e0;
      expv[56] = 41'h0812bf254e0;
      expv[57] = 41'h0812bf254e0;
      expv[58] = 41'h0812bf254e0;
      expv[59] = 41'h0812bf254e0;
      expv[60] = 41'h0812bf254e0;
      expv[61] = 41'h0812bf254e0;
      expv[62] = 41'h0812bf254e0;
      expv[63] = 41'h0812bf254e0;
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
