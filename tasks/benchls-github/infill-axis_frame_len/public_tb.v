// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axis_frame_len dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .monitor_axis_tkeep(in_vec[10:3]),
    .monitor_axis_tvalid(in_vec[2:2]),
    .monitor_axis_tready(in_vec[1:1]),
    .monitor_axis_tlast(in_vec[0:0]),
    .frame_len(out_vec[16:1]),
    .frame_len_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he16;
    stim[1] = 12'hb7b;
    stim[2] = 12'h1f7;
    stim[3] = 12'h48d;
    stim[4] = 12'h6dd;
    stim[5] = 12'h3f9;
    stim[6] = 12'h6e7;
    stim[7] = 12'h0c6;
    stim[8] = 12'h444;
    stim[9] = 12'h299;
    stim[10] = 12'h178;
    stim[11] = 12'h278;
    stim[12] = 12'h1bd;
    stim[13] = 12'h6f2;
    stim[14] = 12'h5a1;
    stim[15] = 12'h7fc;
    stim[16] = 12'h2ec;
    stim[17] = 12'h276;
    stim[18] = 12'h192;
    stim[19] = 12'h4ae;
    stim[20] = 12'h622;
    stim[21] = 12'h714;
    stim[22] = 12'h2f2;
    stim[23] = 12'h317;
    stim[24] = 12'h0cd;
    stim[25] = 12'h701;
    stim[26] = 12'h599;
    stim[27] = 12'h646;
    stim[28] = 12'h7f2;
    stim[29] = 12'h319;
    stim[30] = 12'h683;
    stim[31] = 12'h6d4;
    stim[32] = 12'h064;
    stim[33] = 12'h02a;
    stim[34] = 12'h730;
    stim[35] = 12'h3d7;
    stim[36] = 12'h2ff;
    stim[37] = 12'h085;
    stim[38] = 12'h60d;
    stim[39] = 12'h779;
    stim[40] = 12'h563;
    stim[41] = 12'h5d6;
    stim[42] = 12'hd3c;
    stim[43] = 12'h7ff;
    stim[44] = 12'h36a;
    stim[45] = 12'h4e1;
    stim[46] = 12'h57b;
    stim[47] = 12'h011;
    stim[48] = 12'h360;
    stim[49] = 12'h2e6;
    stim[50] = 12'h155;
    stim[51] = 12'h080;
    stim[52] = 12'h01b;
    stim[53] = 12'h14c;
    stim[54] = 12'h540;
    stim[55] = 12'h186;
    stim[56] = 12'h695;
    stim[57] = 12'h6f1;
    stim[58] = 12'h191;
    stim[59] = 12'h39b;
    stim[60] = 12'h64d;
    stim[61] = 12'h0cd;
    stim[62] = 12'h0ff;
    stim[63] = 12'h098;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00001;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00001;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00001;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00001;
      expv[37] = 17'h00001;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00011;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h0000b;
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
