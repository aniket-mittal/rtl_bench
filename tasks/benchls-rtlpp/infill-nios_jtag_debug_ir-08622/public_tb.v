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

  rtlpp_08622 dut (
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
    stim[0] = 42'h01d1e613bca;
    stim[1] = 42'h397932706dd;
    stim[2] = 42'h37cd2d73bde;
    stim[3] = 42'h0050a99b850;
    stim[4] = 42'h2eadaf15961;
    stim[5] = 42'h0d1c94b7777;
    stim[6] = 42'h2d1e0b589f5;
    stim[7] = 42'h01de1d3c2df;
    stim[8] = 42'h1739d4fd7a8;
    stim[9] = 42'h280fdc0f5ae;
    stim[10] = 42'h38a1c692a16;
    stim[11] = 42'h20a0a387551;
    stim[12] = 42'h1315723d554;
    stim[13] = 42'h3429c4e6623;
    stim[14] = 42'h32a36113326;
    stim[15] = 42'h3180afdf5a7;
    stim[16] = 42'h20b9c336c1e;
    stim[17] = 42'h29209799411;
    stim[18] = 42'h01212c56b51;
    stim[19] = 42'h246461679f1;
    stim[20] = 42'h0f391fe2aee;
    stim[21] = 42'h2eb6d68bbdd;
    stim[22] = 42'h003e3e25906;
    stim[23] = 42'h291ef8e1c70;
    stim[24] = 42'h21a4e7536fd;
    stim[25] = 42'h2e868683168;
    stim[26] = 42'h09892900ce0;
    stim[27] = 42'h2c241e3e52a;
    stim[28] = 42'h012ed68732e;
    stim[29] = 42'h2b4a92059ef;
    stim[30] = 42'h212e367f847;
    stim[31] = 42'h0b32b081146;
    stim[32] = 42'h2da9eaf3cc5;
    stim[33] = 42'h183cddbd497;
    stim[34] = 42'h28ff1a5e57d;
    stim[35] = 42'h3c52f8e9631;
    stim[36] = 42'h1fdff81c1fd;
    stim[37] = 42'h368de031611;
    stim[38] = 42'h1d64970a44c;
    stim[39] = 42'h16e9a66218a;
    stim[40] = 42'h1b6e0540df9;
    stim[41] = 42'h28afc6bd68e;
    stim[42] = 42'h15edb235b63;
    stim[43] = 42'h0bad1b37943;
    stim[44] = 42'h062bd77a350;
    stim[45] = 42'h1af16eef9bf;
    stim[46] = 42'h33694997d3a;
    stim[47] = 42'h20c6cc9a857;
    stim[48] = 42'h1fa94b1bf25;
    stim[49] = 42'h35a5e21484f;
    stim[50] = 42'h27f3517527e;
    stim[51] = 42'h0f9137ed7d5;
    stim[52] = 42'h24afa2e5d65;
    stim[53] = 42'h14ee6094a31;
    stim[54] = 42'h15b3cf8c407;
    stim[55] = 42'h05f012c66aa;
    stim[56] = 42'h2631660cdec;
    stim[57] = 42'h00721662add;
    stim[58] = 42'h0347f9c08c8;
    stim[59] = 42'h20b5e13985d;
    stim[60] = 42'h0c07a27edea;
    stim[61] = 42'h04caf68b2da;
    stim[62] = 42'h147c4274726;
    stim[63] = 42'h0ff7513e30a;
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
      expv[6] = 51'h68e4a5bbba800;
      expv[7] = 51'h68e4a5bbba000;
      expv[8] = 51'h68e4a5bbba000;
      expv[9] = 51'h39cea7ebd4100;
      expv[10] = 51'h39cea7ebd4000;
      expv[11] = 51'h450e34950a002;
      expv[12] = 51'h450e34950a000;
      expv[13] = 51'h18ab91eaaa100;
      expv[14] = 51'h18ab91eaaa000;
      expv[15] = 51'h18ab91eaaa000;
      expv[16] = 51'h18ab91eaaa000;
      expv[17] = 51'h05ce19b60e010;
      expv[18] = 51'h05ce19b60e000;
      expv[19] = 51'h05ce19b60e000;
      expv[20] = 51'h05ce19b60e000;
      expv[21] = 51'h05ce19b60e000;
      expv[22] = 51'h05ce19b60e000;
      expv[23] = 51'h05ce19b60e000;
      expv[24] = 51'h48f7c70e38200;
      expv[25] = 51'h48f7c70e38000;
      expv[26] = 51'h74343418b4400;
      expv[27] = 51'h74343418b4000;
      expv[28] = 51'h74343418b4000;
      expv[29] = 51'h74343418b4000;
      expv[30] = 51'h74343418b4000;
      expv[31] = 51'h0971b3fc22010;
      expv[32] = 51'h0971b3fc22000;
      expv[33] = 51'h0971b3fc22000;
      expv[34] = 51'h0971b3fc22000;
      expv[35] = 51'h0971b3fc22000;
      expv[36] = 51'h0971b3fc22000;
      expv[37] = 51'h7effc0e0fe000;
      expv[38] = 51'h7effc0e0fe000;
      expv[39] = 51'h7effc0e0fe000;
      expv[40] = 51'h7effc0e0fe000;
      expv[41] = 51'h7effc0e0fe000;
      expv[42] = 51'h7effc0e0fe000;
      expv[43] = 51'h2f6d91adb0080;
      expv[44] = 51'h2f6d91adb0000;
      expv[45] = 51'h315ebbd1a8100;
      expv[46] = 51'h315ebbd1a8000;
      expv[47] = 51'h315ebbd1a8000;
      expv[48] = 51'h315ebbd1a8000;
      expv[49] = 51'h7d4a58df92020;
      expv[50] = 51'h7d4a58df92000;
      expv[51] = 51'h7d4a58df92000;
      expv[52] = 51'h7d4a58df92000;
      expv[53] = 51'h257d172eb2008;
      expv[54] = 51'h257d172eb2000;
      expv[55] = 51'h257d172eb2000;
      expv[56] = 51'h257d172eb2000;
      expv[57] = 51'h257d172eb2000;
      expv[58] = 51'h0390b3156e001;
      expv[59] = 51'h0390b3156e000;
      expv[60] = 51'h0390b3156e000;
      expv[61] = 51'h0390b3156e000;
      expv[62] = 51'h0390b3156e000;
      expv[63] = 51'h0390b3156e000;
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
