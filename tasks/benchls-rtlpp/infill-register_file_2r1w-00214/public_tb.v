// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00214 dut (
    .clk(clk),
    .rst_n(in_vec[47:47]),
    .read_a_enable(in_vec[46:46]),
    .read_a_select(in_vec[45:42]),
    .read_b_enable(in_vec[41:41]),
    .read_b_select(in_vec[40:37]),
    .write_enable(in_vec[36:36]),
    .write_select(in_vec[35:32]),
    .write_value(in_vec[31:0]),
    .read_a_value(out_vec[63:32]),
    .read_b_value(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h2f9b7a245a69;
    stim[1] = 48'h78f89274ff05;
    stim[2] = 48'hebd2951788b1;
    stim[3] = 48'h6597a14dcc89;
    stim[4] = 48'hb91175b82e9e;
    stim[5] = 48'hc4bc548997a3;
    stim[6] = 48'hb1f523ac4c9c;
    stim[7] = 48'h901cfeef554b;
    stim[8] = 48'hc5b8d3075a7e;
    stim[9] = 48'h95d121810b4e;
    stim[10] = 48'hb1573f0b71f7;
    stim[11] = 48'hb2d62a2bd641;
    stim[12] = 48'h4aa3dd15849c;
    stim[13] = 48'hc41279917e4c;
    stim[14] = 48'hf2e3704fdb1a;
    stim[15] = 48'h40fb3d65a038;
    stim[16] = 48'hfcfaec581a1b;
    stim[17] = 48'h900d4eb6ab9d;
    stim[18] = 48'h984f06d6b5a9;
    stim[19] = 48'hd490990d3cbd;
    stim[20] = 48'hfdbc99f9f121;
    stim[21] = 48'he117bffd6184;
    stim[22] = 48'hd1f19fd99b44;
    stim[23] = 48'hf2f91693b795;
    stim[24] = 48'hde921a4f74b6;
    stim[25] = 48'h93c3259f30a3;
    stim[26] = 48'hdee64a0c548c;
    stim[27] = 48'hb827e153fdf2;
    stim[28] = 48'h9867449687e5;
    stim[29] = 48'hcdeecf9143ac;
    stim[30] = 48'hac2624bcd52e;
    stim[31] = 48'hc27d4c5d5f5a;
    stim[32] = 48'hf877e653959e;
    stim[33] = 48'hcd907c1a6157;
    stim[34] = 48'h9af2bc3a8f7a;
    stim[35] = 48'h84e890f0a239;
    stim[36] = 48'hf60a2a685c06;
    stim[37] = 48'h9c2ec1128bfa;
    stim[38] = 48'hc6fb417d9436;
    stim[39] = 48'hf173c5aeec39;
    stim[40] = 48'h8b2740dff1c0;
    stim[41] = 48'hb6259b5239bd;
    stim[42] = 48'he1ee185fb295;
    stim[43] = 48'h818ffd3664d4;
    stim[44] = 48'hc70e891ffcd0;
    stim[45] = 48'hb3d5abc2b0a7;
    stim[46] = 48'hbe663e6db9ec;
    stim[47] = 48'hca92012b8d84;
    stim[48] = 48'hab752888dc29;
    stim[49] = 48'he5b9ed2b4f5c;
    stim[50] = 48'hc09d05d0e67b;
    stim[51] = 48'haacd404d4d78;
    stim[52] = 48'ha3fd8eac3f27;
    stim[53] = 48'hafc4c3eb613a;
    stim[54] = 48'hae1ade6ddb07;
    stim[55] = 48'hf12dcb0ce5ed;
    stim[56] = 48'hc38b8fca989d;
    stim[57] = 48'h884522dbaa35;
    stim[58] = 48'h80ff9bfc89ec;
    stim[59] = 48'ha007ab260776;
    stim[60] = 48'hd84ba99bed54;
    stim[61] = 48'hf8c240799d8a;
    stim[62] = 48'hc30c94de70e8;
    stim[63] = 48'hea0bc763d172;
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
      expv[0] = 64'hxxxxxxxx00000000;
      expv[1] = 64'h00000000xxxxxxxx;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h00000000xxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'h75b82e9exxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'h75b82e9exxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxx00000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h00000000xxxxxxxx;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h00000000xxxxxxxx;
      expv[16] = 64'h00000000xxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'h00000000xxxxxxxx;
      expv[20] = 64'h00000000xxxxxxxx;
      expv[21] = 64'h00000000xxxxxxxx;
      expv[22] = 64'h00000000xxxxxxxx;
      expv[23] = 64'h99f9f121bffd6184;
      expv[24] = 64'hbffd618400000000;
      expv[25] = 64'hxxxxxxxx00000000;
      expv[26] = 64'hbffd6184bffd6184;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h00000000xxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h00000000xxxxxxxx;
      expv[33] = 64'h00000000xxxxxxxx;
      expv[34] = 64'hxxxxxxxxe653959e;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'h4c5d5f5a00000000;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'h9fd99b44e653959e;
      expv[39] = 64'h99f9f121xxxxxxxx;
      expv[40] = 64'hxxxxxxxx1693b795;
      expv[41] = 64'hxxxxxxxx9fd99b44;
      expv[42] = 64'h00000000xxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'h9fd99b4400000000;
      expv[45] = 64'hxxxxxxxx00000000;
      expv[46] = 64'hxxxxxxxxc5aeec39;
      expv[47] = 64'hbc3a8f7a00000000;
      expv[48] = 64'hxxxxxxxx417d9436;
      expv[49] = 64'h1693b795xxxxxxxx;
      expv[50] = 64'h00000000xxxxxxxx;
      expv[51] = 64'hxxxxxxxx00000000;
      expv[52] = 64'hxxxxxxxx00000000;
      expv[53] = 64'hxxxxxxxx00000000;
      expv[54] = 64'hxxxxxxxx00000000;
      expv[55] = 64'h99f9f121xxxxxxxx;
      expv[56] = 64'h0000000099f9f121;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'h00000000xxxxxxxx;
      expv[61] = 64'h00000000xxxxxxxx;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'hde6ddb0700000000;
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
