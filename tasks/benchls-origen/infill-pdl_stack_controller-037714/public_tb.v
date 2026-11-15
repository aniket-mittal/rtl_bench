// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_037714 dut (
    .clk(clk),
    .reset(in_vec[52:52]),
    .ir(in_vec[51:20]),
    .state_alu(in_vec[19:19]),
    .state_fetch(in_vec[18:18]),
    .state_mmu(in_vec[17:17]),
    .state_read(in_vec[16:16]),
    .state_write(in_vec[15:15]),
    .destpdltop(in_vec[14:14]),
    .destpdl_x(in_vec[13:13]),
    .destpdl_p(in_vec[12:12]),
    .srcpdlpop(in_vec[11:11]),
    .srcpdltop(in_vec[10:10]),
    .pdlptr(in_vec[9:5]),
    .pdlidx(in_vec[4:0]),
    .pdla(out_vec[10:6]),
    .pdlwrite(out_vec[5:5]),
    .pwp(out_vec[4:4]),
    .pdlenb(out_vec[3:3]),
    .prp(out_vec[2:2]),
    .pdldrive(out_vec[1:1]),
    .pdlcnt(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h147125a603f69c;
    stim[1] = 53'h1702de3639ea2c;
    stim[2] = 53'h0130e9f52d6091;
    stim[3] = 53'h051dc8bebf52fa;
    stim[4] = 53'h0bd29f75b9cdbc;
    stim[5] = 53'h02b970dbe6352a;
    stim[6] = 53'h0f542a633e361a;
    stim[7] = 53'h03d0f17201ebd8;
    stim[8] = 53'h017062e35833a8;
    stim[9] = 53'h0b8bbfa335f963;
    stim[10] = 53'h0575a792291e7e;
    stim[11] = 53'h06cfb3d310d830;
    stim[12] = 53'h0a98c78360d07e;
    stim[13] = 53'h0be9904e9a8594;
    stim[14] = 53'h0dacdaa6980797;
    stim[15] = 53'h00fd942c248339;
    stim[16] = 53'h09a0da593f53aa;
    stim[17] = 53'h07dc5609f2d3f4;
    stim[18] = 53'h0b1179a19b83f4;
    stim[19] = 53'h0a6fd9a2051e93;
    stim[20] = 53'h14e87406ee1ece;
    stim[21] = 53'h0543a1064bc986;
    stim[22] = 53'h0942944b928568;
    stim[23] = 53'h0df7de9e8febd1;
    stim[24] = 53'h05a55657f3bd44;
    stim[25] = 53'h0651bab018fcc8;
    stim[26] = 53'h01e462f2a3b26b;
    stim[27] = 53'h0c72e4c8fd847a;
    stim[28] = 53'h0316cf8f72ad87;
    stim[29] = 53'h00062fa5885269;
    stim[30] = 53'h00b73b64707d11;
    stim[31] = 53'h05cac5a8980b0a;
    stim[32] = 53'h0f8fd9d3004c35;
    stim[33] = 53'h0419f2b2550fb6;
    stim[34] = 53'h0b587b85f131d1;
    stim[35] = 53'h066eeddc9866d6;
    stim[36] = 53'h0b3d7137f868b1;
    stim[37] = 53'h08fa897e20ef65;
    stim[38] = 53'h07c1201e8bdde0;
    stim[39] = 53'h02b10806128a54;
    stim[40] = 53'h0010f0b2dfb78d;
    stim[41] = 53'h01daaa97f142b6;
    stim[42] = 53'h035f307fba073c;
    stim[43] = 53'h00d713c1d498b2;
    stim[44] = 53'h05e6728e98a6ad;
    stim[45] = 53'h064b55b85d708b;
    stim[46] = 53'h0b7dc06c94ebc2;
    stim[47] = 53'h020104451d3d5a;
    stim[48] = 53'h00a5b6bc2fbbef;
    stim[49] = 53'h08691c3fea5fe3;
    stim[50] = 53'h0a12e0e3abbfaf;
    stim[51] = 53'h0a825c1bb7cbaf;
    stim[52] = 53'h0f1457fe254842;
    stim[53] = 53'h0b2a9f45ac114c;
    stim[54] = 53'h0c69cdd30904f6;
    stim[55] = 53'h0bf738db1270f6;
    stim[56] = 53'h0f9854abfa8b50;
    stim[57] = 53'h02db388536b109;
    stim[58] = 53'h0b387f1a1b9363;
    stim[59] = 53'h08708ac2011190;
    stim[60] = 53'h0406967f27c698;
    stim[61] = 53'h0eebca92fd6470;
    stim[62] = 53'h0dd4e4b2a56674;
    stim[63] = 53'h02f43ddc6ea13a;
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
      expv[0] = 11'h53f;
      expv[1] = 11'h47f;
      expv[2] = 11'h460;
      expv[3] = 11'h5e1;
      expv[4] = 11'h73e;
      expv[5] = 11'h26b;
      expv[6] = 11'h42b;
      expv[7] = 11'h63f;
      expv[8] = 11'h221;
      expv[9] = 11'h0ff;
      expv[10] = 11'h4ef;
      expv[11] = 11'h43b;
      expv[12] = 11'h7b1;
      expv[13] = 11'h50a;
      expv[14] = 11'h5ca;
      expv[15] = 11'h640;
      expv[16] = 11'h2a1;
      expv[17] = 11'h531;
      expv[18] = 11'h500;
      expv[19] = 11'h4ef;
      expv[20] = 11'h3ab;
      expv[21] = 11'h33f;
      expv[22] = 11'h20a;
      expv[23] = 11'h7be;
      expv[24] = 11'h2bf;
      expv[25] = 11'h1bb;
      expv[26] = 11'h2f1;
      expv[27] = 11'h0ce;
      expv[28] = 11'h33b;
      expv[29] = 11'h261;
      expv[30] = 11'h469;
      expv[31] = 11'h28b;
      expv[32] = 11'h568;
      expv[33] = 11'h74f;
      expv[34] = 11'h461;
      expv[35] = 11'h5aa;
      expv[36] = 11'h16a;
      expv[37] = 11'h6fa;
      expv[38] = 11'h3ff;
      expv[39] = 11'h48b;
      expv[40] = 11'h37f;
      expv[41] = 11'h5a0;
      expv[42] = 11'h70a;
      expv[43] = 11'h4bb;
      expv[44] = 11'h37a;
      expv[45] = 11'h121;
      expv[46] = 11'h0ba;
      expv[47] = 11'h6af;
      expv[48] = 11'h3ff;
      expv[49] = 11'h7eb;
      expv[50] = 11'h3ff;
      expv[51] = 11'h3fe;
      expv[52] = 11'h0ae;
      expv[53] = 11'h321;
      expv[54] = 11'h1ce;
      expv[55] = 11'h5a1;
      expv[56] = 11'h40a;
      expv[57] = 11'h271;
      expv[58] = 11'h0f1;
      expv[59] = 11'h421;
      expv[60] = 11'h53e;
      expv[61] = 11'h0ee;
      expv[62] = 11'h4ee;
      expv[63] = 11'h270;
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
