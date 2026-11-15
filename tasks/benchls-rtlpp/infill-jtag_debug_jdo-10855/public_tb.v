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

  rtlpp_10855 dut (
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
    stim[0] = 42'h1c628896cc3;
    stim[1] = 42'h271d729a7c2;
    stim[2] = 42'h338b1593bdc;
    stim[3] = 42'h34031061e9e;
    stim[4] = 42'h2aeda779c64;
    stim[5] = 42'h23a6211151b;
    stim[6] = 42'h2f8e10a3242;
    stim[7] = 42'h2d5c1b577d2;
    stim[8] = 42'h3e3ccfa33fc;
    stim[9] = 42'h177c28fcdef;
    stim[10] = 42'h3e9db0c45c8;
    stim[11] = 42'h28b189da028;
    stim[12] = 42'h254a14a27f4;
    stim[13] = 42'h132e439fddf;
    stim[14] = 42'h056f5b57024;
    stim[15] = 42'h2fb4b5124ba;
    stim[16] = 42'h063fb9e0321;
    stim[17] = 42'h2f862b72f90;
    stim[18] = 42'h3c98b8721b6;
    stim[19] = 42'h1fb8fd7ceef;
    stim[20] = 42'h3a38527d872;
    stim[21] = 42'h12438ab77a9;
    stim[22] = 42'h1ec0c24204c;
    stim[23] = 42'h07b6ab66094;
    stim[24] = 42'h227ce6aef4b;
    stim[25] = 42'h1c2dbc81b64;
    stim[26] = 42'h3cf25176fea;
    stim[27] = 42'h1452a333f64;
    stim[28] = 42'h239b1198f51;
    stim[29] = 42'h091dfc84c92;
    stim[30] = 42'h3c37897eb61;
    stim[31] = 42'h28ea1618e8e;
    stim[32] = 42'h0412ada47ad;
    stim[33] = 42'h14ca921f55f;
    stim[34] = 42'h1f32eb253b7;
    stim[35] = 42'h02f06fc7331;
    stim[36] = 42'h3822fcf6be0;
    stim[37] = 42'h1627800208a;
    stim[38] = 42'h04a2fef8be8;
    stim[39] = 42'h3e56c02656d;
    stim[40] = 42'h1846634cf57;
    stim[41] = 42'h1fafe7fe1de;
    stim[42] = 42'h2e9d33b35d0;
    stim[43] = 42'h32de0b96e1c;
    stim[44] = 42'h0fbe47b2eb6;
    stim[45] = 42'h03f5eb0da08;
    stim[46] = 42'h090f1797d8f;
    stim[47] = 42'h1063f939080;
    stim[48] = 42'h33a55a8cf99;
    stim[49] = 42'h24ac63b03b6;
    stim[50] = 42'h3c5c385e156;
    stim[51] = 42'h244dd0e9897;
    stim[52] = 42'h0a4bc8c4321;
    stim[53] = 42'h386ef9ab1f6;
    stim[54] = 42'h2f81c861ad2;
    stim[55] = 42'h13c15f9bc97;
    stim[56] = 42'h1ba1fad3985;
    stim[57] = 42'h2abb3eec633;
    stim[58] = 42'h31b104ae2dd;
    stim[59] = 42'h1b853699ca4;
    stim[60] = 42'h00ea514ee80;
    stim[61] = 42'h3a51d7e171a;
    stim[62] = 42'h3f9de090691;
    stim[63] = 42'h120a6940f42;
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
      expv[3] = 51'hxxxxxxxxxx000;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'h576d3bce3xxx0;
      expv[6] = 51'h576d3bce32000;
      expv[7] = 51'h7c70851920400;
      expv[8] = 51'h7c70851920000;
      expv[9] = 51'h7c70851920000;
      expv[10] = 51'h7c70851920000;
      expv[11] = 51'h74ed8622e4000;
      expv[12] = 51'h74ed8622e4000;
      expv[13] = 51'h74ed8622e4000;
      expv[14] = 51'h74ed8622e4000;
      expv[15] = 51'h2b7adab812200;
      expv[16] = 51'h2b7adab812000;
      expv[17] = 51'h31fdcf0190100;
      expv[18] = 51'h31fdcf0190000;
      expv[19] = 51'h31fdcf0190000;
      expv[20] = 51'h7dc7ebe776400;
      expv[21] = 51'h7dc7ebe776000;
      expv[22] = 51'h7dc7ebe776000;
      expv[23] = 51'h7dc7ebe776000;
      expv[24] = 51'h7dc7ebe776000;
      expv[25] = 51'h7dc7ebe776000;
      expv[26] = 51'h616de40db2020;
      expv[27] = 51'h616de40db2000;
      expv[28] = 51'h2295199fb2040;
      expv[29] = 51'h2295199fb2000;
      expv[30] = 51'h2295199fb2000;
      expv[31] = 51'h61bc4bf5b0002;
      expv[32] = 51'h61bc4bf5b0000;
      expv[33] = 51'h20956d23d6008;
      expv[34] = 51'h20956d23d6000;
      expv[35] = 51'h79975929da020;
      expv[36] = 51'h79975929da000;
      expv[37] = 51'h79975929da000;
      expv[38] = 51'h79975929da000;
      expv[39] = 51'h2517f7c5f4040;
      expv[40] = 51'h2517f7c5f4000;
      expv[41] = 51'h2517f7c5f4000;
      expv[42] = 51'h7d7f3ff0ee020;
      expv[43] = 51'h7d7f3ff0ee000;
      expv[44] = 51'h7d7f3ff0ee000;
      expv[45] = 51'h7d7f3ff0ee000;
      expv[46] = 51'h1faf586d04001;
      expv[47] = 51'h1faf586d04000;
      expv[48] = 51'h031fc9c840001;
      expv[49] = 51'h031fc9c840000;
      expv[50] = 51'h031fc9c840000;
      expv[51] = 51'h62e1c2f0aa800;
      expv[52] = 51'h62e1c2f0aa000;
      expv[53] = 51'h62e1c2f0aa000;
      expv[54] = 51'h62e1c2f0aa000;
      expv[55] = 51'h7c0e430d68100;
      expv[56] = 51'h7c0e430d68000;
      expv[57] = 51'h7c0e430d68000;
      expv[58] = 51'h7c0e430d68000;
      expv[59] = 51'h0d8825716e001;
      expv[60] = 51'h0d8825716e000;
      expv[61] = 51'h0d8825716e000;
      expv[62] = 51'h0d8825716e000;
      expv[63] = 51'h7cef048348020;
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
