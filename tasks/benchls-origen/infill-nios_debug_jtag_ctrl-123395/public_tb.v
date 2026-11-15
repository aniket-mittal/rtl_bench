// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 120;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123395 dut (
    .clk(clk),
    .MonDReg(in_vec[119:88]),
    .break_readreg(in_vec[87:56]),
    .dbrk_hit0_latch(in_vec[55:55]),
    .debugack(in_vec[54:54]),
    .monitor_error(in_vec[53:53]),
    .monitor_ready(in_vec[52:52]),
    .reset_n(in_vec[51:51]),
    .resetlatch(in_vec[50:50]),
    .tracemem_on(in_vec[49:49]),
    .tracemem_trcdata(in_vec[48:13]),
    .tracemem_tw(in_vec[12:12]),
    .trc_im_addr(in_vec[11:5]),
    .trc_on(in_vec[4:4]),
    .trc_wrap(in_vec[3:3]),
    .trigbrktype(in_vec[2:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[49:12]),
    .jrst_n(out_vec[11:11]),
    .st_ready_test_idle(out_vec[10:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 120'h975764dda801dad0a5a72bddc5cc84;
    stim[1] = 120'h92569d0bb1c41fdfb4a3dccccf66f3;
    stim[2] = 120'h3d18a8d1557d33c57d1776f6a697dc;
    stim[3] = 120'hd006e6e7c4e25d7aedca23987a7fef;
    stim[4] = 120'hb31f16282e7cf9c8cef12cf772e611;
    stim[5] = 120'he75b8385ce0bcc772a8773ac4b8bc5;
    stim[6] = 120'h8cb106fb45f03580782e76302757a7;
    stim[7] = 120'hb50e7c2c05c0791f68e138e9934903;
    stim[8] = 120'h6653953986f8975add0c416ccf6607;
    stim[9] = 120'h16b21ce38df1bc44d95ac6f031dce3;
    stim[10] = 120'h32965408a47c75a59e31527d3bdced;
    stim[11] = 120'hf63f749c05de42facf9a37de6b2005;
    stim[12] = 120'hdea94d3af35149ec88f60b3f03a638;
    stim[13] = 120'h414f68b1c53f44b5ebc125644c473b;
    stim[14] = 120'hd5508df2f1909620880399c09a1cb7;
    stim[15] = 120'h51a213df648c7cdfba30af641377e3;
    stim[16] = 120'he905add37d186e7eb8b6e2f08aa71e;
    stim[17] = 120'hcbd4f6f62699271b9e05eeab377dc6;
    stim[18] = 120'h897809ee1e0226b8fbf255cc72f731;
    stim[19] = 120'h7e9b9770689ad0139e9d04b4519354;
    stim[20] = 120'hc8874665cd5b0dbdac95dbf746a1cf;
    stim[21] = 120'h5101280f70a639b4996dc08adf0ec5;
    stim[22] = 120'h9ab73d0167cd7d326ecd9729c0be00;
    stim[23] = 120'hf93cf22fc084b28b1a8c18acba8f9b;
    stim[24] = 120'h4e14d1db46cbe24b9de1051f04bd39;
    stim[25] = 120'h6431233d2d58efaced3a088f33c985;
    stim[26] = 120'he4c4173e64e5a33bba38df72ffee69;
    stim[27] = 120'hf030d717783e7522a8dda206a8ee2f;
    stim[28] = 120'h7ccedfc289f1751cc89372edf25acd;
    stim[29] = 120'haec9671460fee8660caee338a8fe02;
    stim[30] = 120'h1333b4688d6b8a50180e76a37c66dd;
    stim[31] = 120'h69362e419922aa44d8f154aefb6f37;
    stim[32] = 120'hf736d4f811b2e50008fbdac5ab702a;
    stim[33] = 120'h1bd2d3a0d65807158b16e901b9bc5f;
    stim[34] = 120'h37299654b54156da581f1b30aa6efa;
    stim[35] = 120'h87d4ee60855b863438340033f53a29;
    stim[36] = 120'h992ab86b5a562b118ea03dd5f546dd;
    stim[37] = 120'h42223d3096ea93703b901d49a75fab;
    stim[38] = 120'he8052d4865588f5a8b716369adbd4f;
    stim[39] = 120'h2e2adbae170ccbac8b7d8336b9f2fd;
    stim[40] = 120'h410434e7053f6098cea1b3f1c36499;
    stim[41] = 120'hd9a7e6981b18f4da5d554511571300;
    stim[42] = 120'ha9fc0a382c086c36afe8894c6ab268;
    stim[43] = 120'h782498ca7c916e5fa69043c6653c85;
    stim[44] = 120'hf958559990d95eccc93148ca87c94b;
    stim[45] = 120'h7892ceea1df671e73e7bf940bef105;
    stim[46] = 120'h531ac7ad2c6a051eeb374e040d3d6c;
    stim[47] = 120'h87c7c300659d68c7397091002958a1;
    stim[48] = 120'he6d49dc9291c25face48be304cf808;
    stim[49] = 120'h77bacea55cfe34962edf5cbcddbdeb;
    stim[50] = 120'h74fe461956617c73ed667c7199f968;
    stim[51] = 120'h5501d181ea0ee5e0edeb38a002b4ee;
    stim[52] = 120'h6b0023a40c6de828fb6dbc1365090b;
    stim[53] = 120'h34951fd7325def7508ef1f985c97eb;
    stim[54] = 120'hbf046f97b6a695d0dc0e0d879b05e8;
    stim[55] = 120'h50e05f0d36fdd7b94f30c26809453d;
    stim[56] = 120'h7946ade2881a6b54db523f9ed06049;
    stim[57] = 120'h9707023ef5cd5cc0784bb9b23e727f;
    stim[58] = 120'h84325b5c9b93f353da6210a58dd2b5;
    stim[59] = 120'h77e2bbfe64074323b9180b6f622fb1;
    stim[60] = 120'h608eb90b9dd96019ea7e10ee48972e;
    stim[61] = 120'haf56ebc1b4345d7629a238673bd302;
    stim[62] = 120'h56a926b40d3ffcda0fd3f588c676aa;
    stim[63] = 120'h1e47571782ef79f7fd94670b08b6c1;
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
      expv[0] = 50'h0000000000400;
      expv[1] = 50'h0000000000400;
      expv[2] = 50'h0000000000400;
      expv[3] = 50'h0000000000820;
      expv[4] = 50'h0000000000c00;
      expv[5] = 50'h00ce0bcc77880;
      expv[6] = 50'h0000000000c00;
      expv[7] = 50'h0000000000820;
      expv[8] = 50'h0000000000c00;
      expv[9] = 50'h008df1bc44900;
      expv[10] = 50'h0000000000c00;
      expv[11] = 50'h0005de42fa880;
      expv[12] = 50'h0000000000c00;
      expv[13] = 50'h00c53f44b5900;
      expv[14] = 50'h0000000000c00;
      expv[15] = 50'h00648c7cdf900;
      expv[16] = 50'h0000000000c00;
      expv[17] = 50'h000000000080e;
      expv[18] = 50'h0000000000c00;
      expv[19] = 50'h00689ad013880;
      expv[20] = 50'h0000000000c00;
      expv[21] = 50'h0070a639b4880;
      expv[22] = 50'h0000000000c00;
      expv[23] = 50'h00f93cf22f840;
      expv[24] = 50'h0000000000c00;
      expv[25] = 50'h002d58efac880;
      expv[26] = 50'h0000000000c00;
      expv[27] = 50'h000000000080e;
      expv[28] = 50'h0000000000c00;
      expv[29] = 50'h0060fee866900;
      expv[30] = 50'h0000000000c00;
      expv[31] = 50'h0000000000c00;
      expv[32] = 50'h0011b2e500900;
      expv[33] = 50'h0000000000c00;
      expv[34] = 50'h00b54156da900;
      expv[35] = 50'h0000000000c00;
      expv[36] = 50'h0000000000c00;
      expv[37] = 50'h0096ea9370900;
      expv[38] = 50'h0000000000c00;
      expv[39] = 50'h00170ccbac880;
      expv[40] = 50'h0000000000c00;
      expv[41] = 50'h001b18f4daa00;
      expv[42] = 50'h0000000000c00;
      expv[43] = 50'h0000000000400;
      expv[44] = 50'h0000000000400;
      expv[45] = 50'h001df671e7880;
      expv[46] = 50'h0000000000c00;
      expv[47] = 50'h00659d68c7a00;
      expv[48] = 50'h0000000000c00;
      expv[49] = 50'h005cfe3496900;
      expv[50] = 50'h0000000000c00;
      expv[51] = 50'h000000000080e;
      expv[52] = 50'h0000000000c00;
      expv[53] = 50'h00325def75900;
      expv[54] = 50'h0000000000c00;
      expv[55] = 50'h0036fdd7b9880;
      expv[56] = 50'h0000000000c00;
      expv[57] = 50'h000000000080e;
      expv[58] = 50'h0000000000c00;
      expv[59] = 50'h0064074323a00;
      expv[60] = 50'h0000000000c00;
      expv[61] = 50'h00b4345d76900;
      expv[62] = 50'h0000000000c00;
      expv[63] = 50'h0ca3385845810;
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
