// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063441 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .din_data(in_vec[17:4]),
    .din_valid(in_vec[3:3]),
    .din_startofpacket(in_vec[2:2]),
    .din_endofpacket(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[53:53]),
    .dout_data(out_vec[52:39]),
    .dout_valid(out_vec[38:38]),
    .dout_startofpacket(out_vec[37:37]),
    .dout_endofpacket(out_vec[36:36]),
    .im_width(out_vec[35:20]),
    .im_height(out_vec[19:4]),
    .im_interlaced(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h257fc;
    stim[1] = 19'h08fc7;
    stim[2] = 19'h77e22;
    stim[3] = 19'h7f556;
    stim[4] = 19'h6657d;
    stim[5] = 19'h6d44c;
    stim[6] = 19'h68811;
    stim[7] = 19'h6ae33;
    stim[8] = 19'h4234b;
    stim[9] = 19'h69a1a;
    stim[10] = 19'h76c33;
    stim[11] = 19'h76de3;
    stim[12] = 19'h6c906;
    stim[13] = 19'h6a8d1;
    stim[14] = 19'h53355;
    stim[15] = 19'h5ef10;
    stim[16] = 19'h5ae9a;
    stim[17] = 19'h5bd08;
    stim[18] = 19'h7c979;
    stim[19] = 19'h64426;
    stim[20] = 19'h66510;
    stim[21] = 19'h69c97;
    stim[22] = 19'h4c001;
    stim[23] = 19'h76e38;
    stim[24] = 19'h6601f;
    stim[25] = 19'h6a96c;
    stim[26] = 19'h4aff9;
    stim[27] = 19'h65704;
    stim[28] = 19'h41e36;
    stim[29] = 19'h55933;
    stim[30] = 19'h7835f;
    stim[31] = 19'h70f74;
    stim[32] = 19'h4a7c3;
    stim[33] = 19'h5967e;
    stim[34] = 19'h78492;
    stim[35] = 19'h46aa3;
    stim[36] = 19'h72181;
    stim[37] = 19'h625d3;
    stim[38] = 19'h7a235;
    stim[39] = 19'h57e79;
    stim[40] = 19'h7b4f4;
    stim[41] = 19'h5d54e;
    stim[42] = 19'h4e660;
    stim[43] = 19'h4f318;
    stim[44] = 19'h41662;
    stim[45] = 19'h73728;
    stim[46] = 19'h47ff7;
    stim[47] = 19'h645c2;
    stim[48] = 19'h500c3;
    stim[49] = 19'h6fb3c;
    stim[50] = 19'h52192;
    stim[51] = 19'h629df;
    stim[52] = 19'h40a62;
    stim[53] = 19'h6efd3;
    stim[54] = 19'h57fd4;
    stim[55] = 19'h555d9;
    stim[56] = 19'h7d2c1;
    stim[57] = 19'h446fb;
    stim[58] = 19'h52748;
    stim[59] = 19'h6cd99;
    stim[60] = 19'h4977f;
    stim[61] = 19'h63076;
    stim[62] = 19'h51346;
    stim[63] = 19'h5101b;
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
      expv[0] = 54'h32bf8000000000;
      expv[1] = 54'h247e0000000000;
      expv[2] = 54'h3bf10000000000;
      expv[3] = 54'h3faa8000000000;
      expv[4] = 54'h332b8000000000;
      expv[5] = 54'h36a20000000000;
      expv[6] = 54'h34408000000000;
      expv[7] = 54'h35718000000000;
      expv[8] = 54'h211a0000000000;
      expv[9] = 54'h34d08000000000;
      expv[10] = 54'h3b618000000000;
      expv[11] = 54'h3b6f0000000000;
      expv[12] = 54'h36480000000000;
      expv[13] = 54'h35468000000000;
      expv[14] = 54'h299a8000000000;
      expv[15] = 54'h2f788000000000;
      expv[16] = 54'h2d748000000000;
      expv[17] = 54'h2de80000000000;
      expv[18] = 54'h3e4b8000000000;
      expv[19] = 54'h32210000000000;
      expv[20] = 54'h33288000000000;
      expv[21] = 54'h34e48000000000;
      expv[22] = 54'h26000000000000;
      expv[23] = 54'h3b718000000000;
      expv[24] = 54'h33008000000000;
      expv[25] = 54'h354b0000000000;
      expv[26] = 54'h257f8000000000;
      expv[27] = 54'h32b80000000000;
      expv[28] = 54'h20f18000000000;
      expv[29] = 54'h2ac98000000000;
      expv[30] = 54'h3c1a8000000000;
      expv[31] = 54'h387b8000000000;
      expv[32] = 54'h253e0000000000;
      expv[33] = 54'h2cb38000000000;
      expv[34] = 54'h3c248000000000;
      expv[35] = 54'h23550000000000;
      expv[36] = 54'h390c0000000000;
      expv[37] = 54'h312e8000000000;
      expv[38] = 54'h3d118000000000;
      expv[39] = 54'h2bf38000000000;
      expv[40] = 54'h3da78000000000;
      expv[41] = 54'h2eaa0000000000;
      expv[42] = 54'h27330000000000;
      expv[43] = 54'h27988000000000;
      expv[44] = 54'h20b30000000000;
      expv[45] = 54'h39b90000000000;
      expv[46] = 54'h23ff8000000000;
      expv[47] = 54'h322e0000000000;
      expv[48] = 54'h28060000000000;
      expv[49] = 54'h37d98000000000;
      expv[50] = 54'h290c8000000000;
      expv[51] = 54'h314e8000000000;
      expv[52] = 54'h20530000000000;
      expv[53] = 54'h377e8000000000;
      expv[54] = 54'h2bfe8000000000;
      expv[55] = 54'h2aae8000000000;
      expv[56] = 54'h3e960000000000;
      expv[57] = 54'h22378000000000;
      expv[58] = 54'h293a0000000000;
      expv[59] = 54'h366c8000000000;
      expv[60] = 54'h24bb8000000000;
      expv[61] = 54'h31838000000000;
      expv[62] = 54'h289a0000000000;
      expv[63] = 54'h28808000000000;
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
