// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_012872 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .aluc(in_vec[3:0]),
    .r(out_vec[35:4]),
    .zero(out_vec[3:3]),
    .carry(out_vec[2:2]),
    .negative(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h2c0904943fd6bd682;
    stim[1] = 68'hbc079a98b0de77536;
    stim[2] = 68'h0b16915123235858b;
    stim[3] = 68'h7ea3c87cc72084008;
    stim[4] = 68'h450504494d68df9b2;
    stim[5] = 68'h8d488ddbc1c3cec62;
    stim[6] = 68'hc42846426269bd04f;
    stim[7] = 68'h3395e047ea46d29d4;
    stim[8] = 68'h704258be4ec77bdbc;
    stim[9] = 68'hbc1632fcf7615dc7d;
    stim[10] = 68'h9562a866e46d49c61;
    stim[11] = 68'h3862d707cd4ec7636;
    stim[12] = 68'h82a758a86efcd08ab;
    stim[13] = 68'h9347db447c5c295eb;
    stim[14] = 68'h1f6a7d6083c61d360;
    stim[15] = 68'h7ef84b6adb612fd4e;
    stim[16] = 68'hcea0d667e40958706;
    stim[17] = 68'h4b6cc56cecf0b7bf4;
    stim[18] = 68'h5a43f290336e07df9;
    stim[19] = 68'hf9674bcc23354a21b;
    stim[20] = 68'h6edcb100ef5cd20c6;
    stim[21] = 68'h2612833f30b610774;
    stim[22] = 68'h8d1b0249eb96179ec;
    stim[23] = 68'hed20a3eb5cab44eb3;
    stim[24] = 68'h6938a478b39cb3693;
    stim[25] = 68'h4f05b86a23f33333f;
    stim[26] = 68'h18cd85c9007955682;
    stim[27] = 68'h07621376de79ebce9;
    stim[28] = 68'h069fbc63e17e790d3;
    stim[29] = 68'h8c0bf74621a9b18bb;
    stim[30] = 68'h866628ab0c17d0eae;
    stim[31] = 68'h7566d06f2cd33243f;
    stim[32] = 68'h73255ea5209f13e10;
    stim[33] = 68'h7aa83357519072a4d;
    stim[34] = 68'h72737388739ff5195;
    stim[35] = 68'h35f045a76193ae7fc;
    stim[36] = 68'h84b885dffbf16404c;
    stim[37] = 68'h7dba4e426aa4e5d61;
    stim[38] = 68'hc567327f24a50ad63;
    stim[39] = 68'hd3f5c9e6992b74cbf;
    stim[40] = 68'h832b20e4047178604;
    stim[41] = 68'haadef183c75935355;
    stim[42] = 68'h098176a8e1bef165f;
    stim[43] = 68'h433596e2b0bb05dd0;
    stim[44] = 68'h574c1f6ced6131152;
    stim[45] = 68'hedf260c600ad53e94;
    stim[46] = 68'hed367c80de75570b1;
    stim[47] = 68'h55019e292c8e0c1c4;
    stim[48] = 68'h106a83b0899be642e;
    stim[49] = 68'h0bdd58e6f3e78bbbb;
    stim[50] = 68'h6763a2967d34e7416;
    stim[51] = 68'hf405b6830f7c6636f;
    stim[52] = 68'h86b33b4c144557a67;
    stim[53] = 68'he21565e6d69e9fd66;
    stim[54] = 68'h22f21417733c59481;
    stim[55] = 68'h17481596dd6ef38c0;
    stim[56] = 68'h31a62f96ee1a6304e;
    stim[57] = 68'hf53cb78606204b75b;
    stim[58] = 68'h6a58854b7f95f300d;
    stim[59] = 68'hcfd8b558c23597b1d;
    stim[60] = 68'hd3bb5cf92d158cc81;
    stim[61] = 68'h79c157032928618cb;
    stim[62] = 68'h2db9468cbe01aa006;
    stim[63] = 68'h1d7ab7328ae0406b4;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 36'h6bdfc1fc0;
      expv[1] = 36'h0cd9edcb0;
      expv[2] = 36'h000000012;
      expv[3] = 36'h840000002;
      expv[4] = 36'h926de3e43;
      expv[5] = 36'h4f0c5ca15;
      expv[6] = 36'h428464200;
      expv[7] = 36'h2204c0050;
      expv[8] = 36'h0000000e0;
      expv[9] = 36'h01782c654;
      expv[10] = 36'hb0f55ea02;
      expv[11] = 36'hf52c10642;
      expv[12] = 36'h000000012;
      expv[13] = 36'h000000012;
      expv[14] = 36'ha3309a962;
      expv[15] = 36'hb6a000002;
      expv[16] = 36'h2aa98e170;
      expv[17] = 36'h4860852c0;
      expv[18] = 36'h07df00000;
      expv[19] = 36'h000000012;
      expv[20] = 36'h8180630c2;
      expv[21] = 36'h201200370;
      expv[22] = 36'hfffffffe2;
      expv[23] = 36'h90755f006;
      expv[24] = 36'hb59bf10f3;
      expv[25] = 36'hc35000006;
      expv[26] = 36'h1946db310;
      expv[27] = 36'hebce00002;
      expv[28] = 36'h252143560;
      expv[29] = 36'h000000012;
      expv[30] = 36'h98a2ac006;
      expv[31] = 36'hab3683786;
      expv[32] = 36'h93c472863;
      expv[33] = 36'h07aa83350;
      expv[34] = 36'h73fff7990;
      expv[35] = 36'h000000008;
      expv[36] = 36'hf84b885d6;
      expv[37] = 36'h1315686c4;
      expv[38] = 36'ha0c227a96;
      expv[39] = 36'hae4f30006;
      expv[40] = 36'h002120600;
      expv[41] = 36'hefdff5b72;
      expv[42] = 36'h302ed5004;
      expv[43] = 36'hf3f09cbf2;
      expv[44] = 36'h44ad50814;
      expv[45] = 36'h00a040c00;
      expv[46] = 36'h0ec125754;
      expv[47] = 36'h04000c080;
      expv[48] = 36'h41aa0ec00;
      expv[49] = 36'h000000008;
      expv[50] = 36'h1a5745d70;
      expv[51] = 36'ha0c000006;
      expv[52] = 36'h690880110;
      expv[53] = 36'h348bfa300;
      expv[54] = 36'hafb5bacf2;
      expv[55] = 36'hf4b709222;
      expv[56] = 36'h1a62f9604;
      expv[57] = 36'h000000012;
      expv[58] = 36'h6a58854b0;
      expv[59] = 36'h000067ec0;
      expv[60] = 36'ha6a5d0316;
      expv[61] = 36'h000000008;
      expv[62] = 36'h93b8ec8c2;
      expv[63] = 36'h086000220;
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
