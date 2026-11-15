// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088963 dut (
    .cam_pclk(clk),
    .rst_n(in_vec[10:10]),
    .cam_vsync(in_vec[9:9]),
    .cam_href(in_vec[8:8]),
    .cam_data(in_vec[7:0]),
    .cmos_frame_vsync(out_vec[18:18]),
    .cmos_frame_href(out_vec[17:17]),
    .cmos_frame_valid(out_vec[16:16]),
    .cmos_frame_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h215;
    stim[1] = 11'h3e8;
    stim[2] = 11'h653;
    stim[3] = 11'h407;
    stim[4] = 11'h66e;
    stim[5] = 11'h65f;
    stim[6] = 11'h655;
    stim[7] = 11'h600;
    stim[8] = 11'h615;
    stim[9] = 11'h79a;
    stim[10] = 11'h6d0;
    stim[11] = 11'h77b;
    stim[12] = 11'h52b;
    stim[13] = 11'h584;
    stim[14] = 11'h621;
    stim[15] = 11'h4db;
    stim[16] = 11'h6d0;
    stim[17] = 11'h46d;
    stim[18] = 11'h5af;
    stim[19] = 11'h5a1;
    stim[20] = 11'h591;
    stim[21] = 11'h76f;
    stim[22] = 11'h60f;
    stim[23] = 11'h654;
    stim[24] = 11'h42b;
    stim[25] = 11'h57b;
    stim[26] = 11'h56e;
    stim[27] = 11'h471;
    stim[28] = 11'h6d2;
    stim[29] = 11'h50d;
    stim[30] = 11'h520;
    stim[31] = 11'h5b7;
    stim[32] = 11'h41e;
    stim[33] = 11'h42c;
    stim[34] = 11'h73a;
    stim[35] = 11'h53b;
    stim[36] = 11'h7dd;
    stim[37] = 11'h763;
    stim[38] = 11'h7dd;
    stim[39] = 11'h7da;
    stim[40] = 11'h690;
    stim[41] = 11'h49c;
    stim[42] = 11'h614;
    stim[43] = 11'h47c;
    stim[44] = 11'h618;
    stim[45] = 11'h77d;
    stim[46] = 11'h589;
    stim[47] = 11'h4c4;
    stim[48] = 11'h5fd;
    stim[49] = 11'h426;
    stim[50] = 11'h61f;
    stim[51] = 11'h419;
    stim[52] = 11'h486;
    stim[53] = 11'h612;
    stim[54] = 11'h425;
    stim[55] = 11'h7cb;
    stim[56] = 11'h411;
    stim[57] = 11'h547;
    stim[58] = 11'h793;
    stim[59] = 11'h401;
    stim[60] = 11'h5b6;
    stim[61] = 11'h5d9;
    stim[62] = 11'h569;
    stim[63] = 11'h5fa;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h00000;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00000;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h00000;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h00000;
      expv[27] = 19'h00000;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h47d89;
      expv[53] = 19'h07d89;
      expv[54] = 19'h07d89;
      expv[55] = 19'h47d89;
      expv[56] = 19'h07d89;
      expv[57] = 19'h77d89;
      expv[58] = 19'h07d89;
      expv[59] = 19'h34793;
      expv[60] = 19'h64793;
      expv[61] = 19'h04793;
      expv[62] = 19'h3b6d9;
      expv[63] = 19'h2b6d9;
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
