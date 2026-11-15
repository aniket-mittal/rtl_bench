// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126740 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[45:45]),
    .wb_adr_i(in_vec[44:29]),
    .wb_dat_i(in_vec[28:13]),
    .wb_sel_i(in_vec[12:11]),
    .wb_we_i(in_vec[10:10]),
    .wb_stb_i(in_vec[9:9]),
    .wb_cyc_i(in_vec[8:8]),
    .sw_(in_vec[7:0]),
    .wb_dat_o(out_vec[24:9]),
    .wb_ack_o(out_vec[8:8]),
    .leds_(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h30ed854a42eb;
    stim[1] = 46'h3edfc577668a;
    stim[2] = 46'h07fc5d49068f;
    stim[3] = 46'h2f15864c44c1;
    stim[4] = 46'h18e3eae17c3e;
    stim[5] = 46'h082586c3d777;
    stim[6] = 46'h0261cc3ce5b3;
    stim[7] = 46'h1e928766c3b7;
    stim[8] = 46'h1617e939dcba;
    stim[9] = 46'h1ea985e03cae;
    stim[10] = 46'h06083feeda9e;
    stim[11] = 46'h04912e059b23;
    stim[12] = 46'h18113fbe2e2f;
    stim[13] = 46'h0068f7f714ed;
    stim[14] = 46'h145f5da771a6;
    stim[15] = 46'h0245ccfd13fa;
    stim[16] = 46'h07bd12d439ca;
    stim[17] = 46'h1ed82afa3d96;
    stim[18] = 46'h1968b3cd0e89;
    stim[19] = 46'h186dee9e8279;
    stim[20] = 46'h1a7b16def098;
    stim[21] = 46'h0e2fd6f55756;
    stim[22] = 46'h1b8dc0958899;
    stim[23] = 46'h1e408405a1d9;
    stim[24] = 46'h09db0c8af668;
    stim[25] = 46'h1d945d3dc578;
    stim[26] = 46'h1d1a3af7aeaf;
    stim[27] = 46'h1e7c6348e7e5;
    stim[28] = 46'h08f72d6f5d20;
    stim[29] = 46'h14a2824d9924;
    stim[30] = 46'h1940166ced6c;
    stim[31] = 46'h02ca49efed7b;
    stim[32] = 46'h0d401b281fc3;
    stim[33] = 46'h07858c9257ac;
    stim[34] = 46'h03c6d3309eee;
    stim[35] = 46'h16d8badbf316;
    stim[36] = 46'h092dd9cacece;
    stim[37] = 46'h01a115a601a6;
    stim[38] = 46'h08ed6a2cf695;
    stim[39] = 46'h137187d16f6d;
    stim[40] = 46'h07c91185dcc5;
    stim[41] = 46'h04ee07f38a7a;
    stim[42] = 46'h124ce9482ab1;
    stim[43] = 46'h037244297a85;
    stim[44] = 46'h042d348852f9;
    stim[45] = 46'h1a71653d1b36;
    stim[46] = 46'h11c1911ec71d;
    stim[47] = 46'h046d96a2b8e5;
    stim[48] = 46'h111275162629;
    stim[49] = 46'h1d42801194d3;
    stim[50] = 46'h0f8995245a69;
    stim[51] = 46'h0a44364d15bc;
    stim[52] = 46'h0028e425e1c7;
    stim[53] = 46'h1bd691a9522a;
    stim[54] = 46'h1a41c1bb6878;
    stim[55] = 46'h037fcb1435d3;
    stim[56] = 46'h0962c643aeaa;
    stim[57] = 46'h052eca24ad54;
    stim[58] = 46'h05de979d54da;
    stim[59] = 46'h1f5e1a24afe2;
    stim[60] = 46'h11e7e7748fa5;
    stim[61] = 46'h04f2a3107ea1;
    stim[62] = 46'h021b215050e4;
    stim[63] = 46'h0482b33e9198;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0000000;
      expv[6] = 25'h000011e;
      expv[7] = 25'h000001e;
      expv[8] = 25'h0003d1e;
      expv[9] = 25'h0003c1e;
      expv[10] = 25'h0003c1e;
      expv[11] = 25'h0003c1e;
      expv[12] = 25'h0003d1e;
      expv[13] = 25'h0003c1e;
      expv[14] = 25'h0003c1e;
      expv[15] = 25'h0003c1e;
      expv[16] = 25'h0003d1e;
      expv[17] = 25'h0003c1e;
      expv[18] = 25'h0003c1e;
      expv[19] = 25'h0003c1e;
      expv[20] = 25'h0003c1e;
      expv[21] = 25'h0003c1e;
      expv[22] = 25'h0003daa;
      expv[23] = 25'h0003caa;
      expv[24] = 25'h0003caa;
      expv[25] = 25'h0003caa;
      expv[26] = 25'h0003caa;
      expv[27] = 25'h0003caa;
      expv[28] = 25'h0015547;
      expv[29] = 25'h0015447;
      expv[30] = 25'h0015447;
      expv[31] = 25'h0015447;
      expv[32] = 25'h0015447;
      expv[33] = 25'h0008f40;
      expv[34] = 25'h0008192;
      expv[35] = 25'h0008092;
      expv[36] = 25'h0012592;
      expv[37] = 25'h0012492;
      expv[38] = 25'h0012492;
      expv[39] = 25'h0012492;
      expv[40] = 25'h001258b;
      expv[41] = 25'h001248b;
      expv[42] = 25'h001248b;
      expv[43] = 25'h001248b;
      expv[44] = 25'h001248b;
      expv[45] = 25'h001248b;
      expv[46] = 25'h001178b;
      expv[47] = 25'h00117f6;
      expv[48] = 25'h00116f6;
      expv[49] = 25'h00116f6;
      expv[50] = 25'h00116f6;
      expv[51] = 25'h00116f6;
      expv[52] = 25'h00116f6;
      expv[53] = 25'h00116f6;
      expv[54] = 25'h00116f6;
      expv[55] = 25'h00116f6;
      expv[56] = 25'h00116f6;
      expv[57] = 25'h00116f6;
      expv[58] = 25'h00116f6;
      expv[59] = 25'h00116f6;
      expv[60] = 25'h001ed25;
      expv[61] = 25'h0004ba4;
      expv[62] = 25'h0004aa4;
      expv[63] = 25'h0004aa4;
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
