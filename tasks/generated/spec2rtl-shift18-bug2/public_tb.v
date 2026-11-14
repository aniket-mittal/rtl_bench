// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hf22b9b933997f9f74;
    stim[1] = 68'h1abda7572b25fbe34;
    stim[2] = 68'ha93675b72723903dc;
    stim[3] = 68'h75dd0eed6acb3c817;
    stim[4] = 68'ha37031e8237a567c1;
    stim[5] = 68'h85008af45e3bd0722;
    stim[6] = 68'hd169fd6b80eaba409;
    stim[7] = 68'h0d8d9d32c83c533f9;
    stim[8] = 68'h9d8120f08bd68eae8;
    stim[9] = 68'h6b6f7c4535489f170;
    stim[10] = 68'h9308c9825db22d1f7;
    stim[11] = 68'hc9c0d4cd6fb5bb094;
    stim[12] = 68'h883f57fba29776187;
    stim[13] = 68'h38418bba026ec9cb1;
    stim[14] = 68'h7aaa9d81ebd272c2b;
    stim[15] = 68'hc60294eece08c0142;
    stim[16] = 68'h2754e815c76187ad3;
    stim[17] = 68'h4f35e7dc9ee0907a5;
    stim[18] = 68'h9dc89651293fc3ae2;
    stim[19] = 68'h538cd35468a2145e5;
    stim[20] = 68'h4a824e8694c0b2c25;
    stim[21] = 68'h54aa7f95dfcc7a6ff;
    stim[22] = 68'h2e43c51640f4ef7d2;
    stim[23] = 68'hf4ed0a2ada2a31c8c;
    stim[24] = 68'h9e0d5633d364791ce;
    stim[25] = 68'hbcd9efa31f4e2af5c;
    stim[26] = 68'hc70c7eff82d71cc66;
    stim[27] = 68'hf9cbc7910ff748985;
    stim[28] = 68'hf2ea2dc598ecf5d11;
    stim[29] = 68'hf84eb04a05e466ec8;
    stim[30] = 68'haca7d7c971f07e040;
    stim[31] = 68'h7119a7ce85bc7c91c;
    stim[32] = 68'h3da4355bb50559723;
    stim[33] = 68'h9e17e14c53ddde673;
    stim[34] = 68'h79e329cc0a30995ca;
    stim[35] = 68'hfea4f8e08f07ab1cb;
    stim[36] = 68'hddacf2a48e00dc58e;
    stim[37] = 68'ha7d607899bde273bb;
    stim[38] = 68'hbc003edd54fa2cfc2;
    stim[39] = 68'h1c8c3e340a04cedb4;
    stim[40] = 68'h7eeee4f77675de233;
    stim[41] = 68'hc263c39959cbff313;
    stim[42] = 68'h50cb8bc89e76f5630;
    stim[43] = 68'ha4aee39f673f5d3c9;
    stim[44] = 68'haba4055dbe3e45e9f;
    stim[45] = 68'h74df15553696eb659;
    stim[46] = 68'hb2c861db7400e2e63;
    stim[47] = 68'h75f50b02d3155166b;
    stim[48] = 68'he2a78d5ecbb0ee383;
    stim[49] = 68'hb41569683e5f67a65;
    stim[50] = 68'h56adec41440a5e538;
    stim[51] = 68'h70a679182b309c242;
    stim[52] = 68'h6c0b12f18dca79c03;
    stim[53] = 68'h5cd6973a58735d35f;
    stim[54] = 68'h9cc1c07c0944eee7c;
    stim[55] = 68'hb6fd041c2fe26f53c;
    stim[56] = 68'h0f246d8198d34586b;
    stim[57] = 68'h0ebdb977a3823525d;
    stim[58] = 68'hfb676bb8f83de162d;
    stim[59] = 68'h38128d9fcb6836391;
    stim[60] = 68'h5b320a3989aa93166;
    stim[61] = 68'h3633d869bf0628f04;
    stim[62] = 68'h5a0c3e26c821ccdf2;
    stim[63] = 68'hcabab3fdcc167a802;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h22b9b933997f9f74;
      expv[2] = 64'h22b9b933997f9f74;
      expv[3] = 64'h93675b72723903dc;
      expv[4] = 64'hff93675b72723903;
      expv[5] = 64'h37031e8237a567c1;
      expv[6] = 64'h5008af45e3bd0722;
      expv[7] = 64'h169fd6b80eaba409;
      expv[8] = 64'h169fd6b80eaba409;
      expv[9] = 64'hd8120f08bd68eae8;
      expv[10] = 64'h6c0907845eb47574;
      expv[11] = 64'h308c9825db22d1f7;
      expv[12] = 64'h9c0d4cd6fb5bb094;
      expv[13] = 64'h83f57fba29776187;
      expv[14] = 64'h83f57fba29776187;
      expv[15] = 64'hff83f57fba297761;
      expv[16] = 64'h60294eece08c0142;
      expv[17] = 64'h60294eece08c0142;
      expv[18] = 64'hc0529dd9c1180284;
      expv[19] = 64'hdc89651293fc3ae2;
      expv[20] = 64'h89651293fc3ae200;
      expv[21] = 64'h12ca2527f875c400;
      expv[22] = 64'hca2527f875c40000;
      expv[23] = 64'hca2527f875c40000;
      expv[24] = 64'h4ed0a2ada2a31c8c;
      expv[25] = 64'he0d5633d364791ce;
      expv[26] = 64'hcd9efa31f4e2af5c;
      expv[27] = 64'h70c7eff82d71cc66;
      expv[28] = 64'h9cbc7910ff748985;
      expv[29] = 64'h2ea2dc598ecf5d11;
      expv[30] = 64'h84eb04a05e466ec8;
      expv[31] = 64'hca7d7c971f07e040;
      expv[32] = 64'hffca7d7c971f07e0;
      expv[33] = 64'hffca7d7c971f07e0;
      expv[34] = 64'he17e14c53ddde673;
      expv[35] = 64'hffe17e14c53ddde6;
      expv[36] = 64'hea4f8e08f07ab1cb;
      expv[37] = 64'hdacf2a48e00dc58e;
      expv[38] = 64'h7d607899bde273bb;
      expv[39] = 64'hc003edd54fa2cfc2;
      expv[40] = 64'hc003edd54fa2cfc2;
      expv[41] = 64'hffc003edd54fa2cf;
      expv[42] = 64'h263c39959cbff313;
      expv[43] = 64'h3c39959cbff31300;
      expv[44] = 64'h4aee39f673f5d3c9;
      expv[45] = 64'hba4055dbe3e45e9f;
      expv[46] = 64'hffba4055dbe3e45e;
      expv[47] = 64'h2c861db7400e2e63;
      expv[48] = 64'h002c861db7400e2e;
      expv[49] = 64'h2a78d5ecbb0ee383;
      expv[50] = 64'h41569683e5f67a65;
      expv[51] = 64'h569683e5f67a6500;
      expv[52] = 64'h00569683e5f67a65;
      expv[53] = 64'h002b4b41f2fb3d32;
      expv[54] = 64'h2b4b41f2fb3d3200;
      expv[55] = 64'hcc1c07c0944eee7c;
      expv[56] = 64'h6fd041c2fe26f53c;
      expv[57] = 64'h6fd041c2fe26f53c;
      expv[58] = 64'h6fd041c2fe26f53c;
      expv[59] = 64'hb676bb8f83de162d;
      expv[60] = 64'hb676bb8f83de162d;
      expv[61] = 64'h76bb8f83de162d00;
      expv[62] = 64'h76bb8f83de162d00;
      expv[63] = 64'hbb8f83de162d0000;
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
