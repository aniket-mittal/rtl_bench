// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10911 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0cec53cf70b;
    stim[1] = 42'h08ea61e0c80;
    stim[2] = 42'h2effce8eff3;
    stim[3] = 42'h082750ce827;
    stim[4] = 42'h122401fce4e;
    stim[5] = 42'h3f2bbe8f9ac;
    stim[6] = 42'h3ead4fbc2b6;
    stim[7] = 42'h150100f09dc;
    stim[8] = 42'h02b3bc975e4;
    stim[9] = 42'h209cb08bc3b;
    stim[10] = 42'h259d1fc88a1;
    stim[11] = 42'h227e7aadbb3;
    stim[12] = 42'h120a0851be8;
    stim[13] = 42'h21e9dcc7bdb;
    stim[14] = 42'h0425cf5aca6;
    stim[15] = 42'h278ef7f3a4e;
    stim[16] = 42'h0f47bcea3b1;
    stim[17] = 42'h3345fd61796;
    stim[18] = 42'h1ec85b06d44;
    stim[19] = 42'h2b9a17528d2;
    stim[20] = 42'h13526d37ca6;
    stim[21] = 42'h2c36ef148b8;
    stim[22] = 42'h3f5df000f20;
    stim[23] = 42'h2411ba71ed2;
    stim[24] = 42'h0b4af721254;
    stim[25] = 42'h22329ca3746;
    stim[26] = 42'h07c179c353b;
    stim[27] = 42'h3135793c46d;
    stim[28] = 42'h1fe2185248c;
    stim[29] = 42'h2e3cd47e867;
    stim[30] = 42'h11c0dd85887;
    stim[31] = 42'h14218283ec0;
    stim[32] = 42'h0669d401285;
    stim[33] = 42'h2f394e9e5ab;
    stim[34] = 42'h00adff0f17c;
    stim[35] = 42'h0d80f755e3e;
    stim[36] = 42'h27475b18ed2;
    stim[37] = 42'h39d9c41884a;
    stim[38] = 42'h178f83cf4d5;
    stim[39] = 42'h26100ea9290;
    stim[40] = 42'h2e7574e905f;
    stim[41] = 42'h07c22cbedb1;
    stim[42] = 42'h364918ffad8;
    stim[43] = 42'h19d3a48e6e5;
    stim[44] = 42'h3496a85fd77;
    stim[45] = 42'h0bf92d1858b;
    stim[46] = 42'h3ad34791af3;
    stim[47] = 42'h147698adb93;
    stim[48] = 42'h32e4fcd4189;
    stim[49] = 42'h29e177d4a60;
    stim[50] = 42'h0e2f81d9854;
    stim[51] = 42'h00cc4e6399a;
    stim[52] = 42'h29451f06661;
    stim[53] = 42'h05da72b3ff7;
    stim[54] = 42'h1179f129f7c;
    stim[55] = 42'h19ed38a1ee0;
    stim[56] = 42'h23183775f40;
    stim[57] = 42'h372fe808070;
    stim[58] = 42'h030bb146ec0;
    stim[59] = 42'h33c881a307a;
    stim[60] = 42'h0efe255caf2;
    stim[61] = 42'h27fddbffbeb;
    stim[62] = 42'h09f8c3a254d;
    stim[63] = 42'h09df6fa795c;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'h795df47cd6000;
      expv[7] = 51'h795df47cd6000;
      expv[8] = 51'h795df47cd6000;
      expv[9] = 51'h795df47cd6000;
      expv[10] = 51'h04e5845e1c000;
      expv[11] = 51'h04e5845e1c000;
      expv[12] = 51'h04e5845e1c000;
      expv[13] = 51'h1050428df4001;
      expv[14] = 51'h1050428df4000;
      expv[15] = 51'h212e7ad652040;
      expv[16] = 51'h212e7ad652000;
      expv[17] = 51'h7a3de751d8100;
      expv[18] = 51'h7a3de751d8000;
      expv[19] = 51'h7a3de751d8000;
      expv[20] = 51'h7a3de751d8000;
      expv[21] = 51'h1a9369be52010;
      expv[22] = 51'h1a9369be52000;
      expv[23] = 51'h7aef800790400;
      expv[24] = 51'h7aef800790000;
      expv[25] = 51'h7aef800790000;
      expv[26] = 51'h7aef800790000;
      expv[27] = 51'h3e0bce1a9c004;
      expv[28] = 51'h3e0bce1a9c000;
      expv[29] = 51'h7f10c29246400;
      expv[30] = 51'h7f10c29246000;
      expv[31] = 51'h7f10c29246000;
      expv[32] = 51'h7f10c29246000;
      expv[33] = 51'h334ea00942100;
      expv[34] = 51'h334ea00942000;
      expv[35] = 51'h334ea00942000;
      expv[36] = 51'h334ea00942000;
      expv[37] = 51'h3a3ad8c768100;
      expv[38] = 51'h3a3ad8c768000;
      expv[39] = 51'h3c7c1e7a6a100;
      expv[40] = 51'h3c7c1e7a6a000;
      expv[41] = 51'h3c7c1e7a6a000;
      expv[42] = 51'h3c7c1e7a6a000;
      expv[43] = 51'h3c7c1e7a6a000;
      expv[44] = 51'h4e9d247372020;
      expv[45] = 51'h4e9d247372000;
      expv[46] = 51'h4e9d247372000;
      expv[47] = 51'h4e9d247372000;
      expv[48] = 51'h23b4c56dc8080;
      expv[49] = 51'h23b4c56dc8000;
      expv[50] = 51'h23b4c56dc8000;
      expv[51] = 51'h23b4c56dc8000;
      expv[52] = 51'h23b4c56dc8000;
      expv[53] = 51'h23b4c56dc8000;
      expv[54] = 51'h23b4c56dc8000;
      expv[55] = 51'h0bcf894fbe080;
      expv[56] = 51'h0bcf894fbe000;
      expv[57] = 51'h18c1bbafa0001;
      expv[58] = 51'h18c1bbafa0000;
      expv[59] = 51'h18c1bbafa0000;
      expv[60] = 51'h18c1bbafa0000;
      expv[61] = 51'h18c1bbafa0000;
      expv[62] = 51'h18c1bbafa0000;
      expv[63] = 51'h4fc61d12a6020;
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
