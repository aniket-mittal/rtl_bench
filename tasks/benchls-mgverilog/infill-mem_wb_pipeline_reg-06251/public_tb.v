// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 105;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06251 dut (
    .clk(clk),
    .rst(in_vec[104:104]),
    .RegWrite_In(in_vec[103:103]),
    .PC_In(in_vec[102:71]),
    .ALUOut_In(in_vec[70:39]),
    .rdata_In(in_vec[38:7]),
    .AddrC_In(in_vec[6:2]),
    .MemtoReg_In(in_vec[1:0]),
    .RegWrite_Out(out_vec[103:103]),
    .PC_Out(out_vec[102:71]),
    .ALUOut_Out(out_vec[70:39]),
    .rdata_Out(out_vec[38:7]),
    .AddrC_Out(out_vec[6:2]),
    .MemtoReg_Out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 105'h162307efb7dc27f45c4bb20808a;
    stim[1] = 105'h13912764f35cfc12eda3924cc6a;
    stim[2] = 105'h0cb70d75729ffad3ca70e45a2f1;
    stim[3] = 105'h0d660df38945b4fbed8b37b54d0;
    stim[4] = 105'h0935c1dfccc85ce6c08210c21a2;
    stim[5] = 105'h084fad0bb4100abc3c405911b29;
    stim[6] = 105'h0d233fa2fb98fdab9539ea5d5f5;
    stim[7] = 105'h0a647310ddfbaf933492ee1c7f4;
    stim[8] = 105'h011f0c02bb863ea6224c141e2d0;
    stim[9] = 105'h03c269c6cf02308702c4fccbf5a;
    stim[10] = 105'h0d72c1ce19a31e7236da2af2cd2;
    stim[11] = 105'h0dc9b8af16a4010e26fbb71420c;
    stim[12] = 105'h0bef25b0920f71d7510fa24a8c5;
    stim[13] = 105'h09b051b866b8374489e077fe46f;
    stim[14] = 105'h02f1263889d78b92ee30764b15e;
    stim[15] = 105'h045507411f52c150a3b4f268534;
    stim[16] = 105'h010d93aca23f6a43dee3bdd6ba8;
    stim[17] = 105'h0f31fbba061ccaa005c0dd24def;
    stim[18] = 105'h08cc9455b4f5ab7bb72198aa52e;
    stim[19] = 105'h09a394a159748aca2407ebbc3ee;
    stim[20] = 105'h02390553accbb67693360130a61;
    stim[21] = 105'h054b8f6d7a3e8fef11e15f1aa4d;
    stim[22] = 105'h00ddbaf013e1afd3ce5a4d3ae1c;
    stim[23] = 105'h0abad0ea784302e0f90028a4fd9;
    stim[24] = 105'h0ff74e3b65aff72d06e78aca092;
    stim[25] = 105'h0cb3415798bb8cff82ecf50576b;
    stim[26] = 105'h0a8b9cb93f572a1f33fc2c8e4f3;
    stim[27] = 105'h0aaeb0585b4b08c12c67ebd72e9;
    stim[28] = 105'h009789ec8c2eaa036760126e9c0;
    stim[29] = 105'h06ebfaf321e659a6214a4dff73a;
    stim[30] = 105'h017e09cded7019671aceb58b029;
    stim[31] = 105'h0e4aa6628398aef001a985a8da2;
    stim[32] = 105'h05aff8cf675c0e968d7e8c20026;
    stim[33] = 105'h07a15e0592477896d607a46f965;
    stim[34] = 105'h05fe2061b1c86fb9ed360e1b164;
    stim[35] = 105'h0d20a4c11372bcca01695108066;
    stim[36] = 105'h0ddce202e46e2ca0e9a156ec6de;
    stim[37] = 105'h061fd148a65154b45c68c56a237;
    stim[38] = 105'h01c85c27b0b5e93e16993a67bb4;
    stim[39] = 105'h0c1b90ff89c8bf8972d4b7b0feb;
    stim[40] = 105'h0bb8064d6b93b92b977774202d0;
    stim[41] = 105'h05cac13f1d80d27185aaee42dd8;
    stim[42] = 105'h0f4c25bf53cbcbc1d3b8d7aaaa7;
    stim[43] = 105'h03be56129ca421b4f2517a8d907;
    stim[44] = 105'h07b13dcad624c7c381c4a3871b4;
    stim[45] = 105'h0987d162677f41fd0f2e5d70971;
    stim[46] = 105'h04a81d79b516038108558b228ca;
    stim[47] = 105'h0df1df466c1f1ce30a76befebee;
    stim[48] = 105'h09185ead06a3d1839a83ec528d1;
    stim[49] = 105'h08dcb0d9838cd2c8e8bc6537917;
    stim[50] = 105'h07313709c5646de017c8da65a48;
    stim[51] = 105'h0ca501d5867fec89b4d6d387b23;
    stim[52] = 105'h0012bc74abb6b2130298131e1c9;
    stim[53] = 105'h00f36afed926124abe8a80e3921;
    stim[54] = 105'h0b926c83f5b86213124b971b536;
    stim[55] = 105'h07f19366bef5a4cab700cc22b7f;
    stim[56] = 105'h0199b2e7d6f2e700411aebab480;
    stim[57] = 105'h046690f0d09216c681c17355a2c;
    stim[58] = 105'h0200cbb674310ec0ed3e5d20060;
    stim[59] = 105'h051b9a4e7e8be9aa9f82afbf1f3;
    stim[60] = 105'h059cb29b37f419f7abe65f8bc6e;
    stim[61] = 105'h0e30f79beb729f7e0310cd503b9;
    stim[62] = 105'h03c1baefda7dec8ef1ffeec2a38;
    stim[63] = 105'h02d8ea24a705f5c2db1e93dc309;
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
      expv[0] = 104'h00000000000000000000000000;
      expv[1] = 104'h00000000000000000000000000;
      expv[2] = 104'h00000000000000000000000000;
      expv[3] = 104'hcb70d75729ffad3ca70e45a2f1;
      expv[4] = 104'hd660df38945b4fbed8b37b54d0;
      expv[5] = 104'h935c1dfccc85ce6c08210c21a2;
      expv[6] = 104'h84fad0bb4100abc3c405911b29;
      expv[7] = 104'hd233fa2fb98fdab9539ea5d5f5;
      expv[8] = 104'ha647310ddfbaf933492ee1c7f4;
      expv[9] = 104'h11f0c02bb863ea6224c141e2d0;
      expv[10] = 104'h3c269c6cf02308702c4fccbf5a;
      expv[11] = 104'hd72c1ce19a31e7236da2af2cd2;
      expv[12] = 104'hdc9b8af16a4010e26fbb71420c;
      expv[13] = 104'hbef25b0920f71d7510fa24a8c5;
      expv[14] = 104'h9b051b866b8374489e077fe46f;
      expv[15] = 104'h2f1263889d78b92ee30764b15e;
      expv[16] = 104'h45507411f52c150a3b4f268534;
      expv[17] = 104'h10d93aca23f6a43dee3bdd6ba8;
      expv[18] = 104'hf31fbba061ccaa005c0dd24def;
      expv[19] = 104'h8cc9455b4f5ab7bb72198aa52e;
      expv[20] = 104'h9a394a159748aca2407ebbc3ee;
      expv[21] = 104'h2390553accbb67693360130a61;
      expv[22] = 104'h54b8f6d7a3e8fef11e15f1aa4d;
      expv[23] = 104'h0ddbaf013e1afd3ce5a4d3ae1c;
      expv[24] = 104'habad0ea784302e0f90028a4fd9;
      expv[25] = 104'hff74e3b65aff72d06e78aca092;
      expv[26] = 104'hcb3415798bb8cff82ecf50576b;
      expv[27] = 104'ha8b9cb93f572a1f33fc2c8e4f3;
      expv[28] = 104'haaeb0585b4b08c12c67ebd72e9;
      expv[29] = 104'h09789ec8c2eaa036760126e9c0;
      expv[30] = 104'h6ebfaf321e659a6214a4dff73a;
      expv[31] = 104'h17e09cded7019671aceb58b029;
      expv[32] = 104'he4aa6628398aef001a985a8da2;
      expv[33] = 104'h5aff8cf675c0e968d7e8c20026;
      expv[34] = 104'h7a15e0592477896d607a46f965;
      expv[35] = 104'h5fe2061b1c86fb9ed360e1b164;
      expv[36] = 104'hd20a4c11372bcca01695108066;
      expv[37] = 104'hddce202e46e2ca0e9a156ec6de;
      expv[38] = 104'h61fd148a65154b45c68c56a237;
      expv[39] = 104'h1c85c27b0b5e93e16993a67bb4;
      expv[40] = 104'hc1b90ff89c8bf8972d4b7b0feb;
      expv[41] = 104'hbb8064d6b93b92b977774202d0;
      expv[42] = 104'h5cac13f1d80d27185aaee42dd8;
      expv[43] = 104'hf4c25bf53cbcbc1d3b8d7aaaa7;
      expv[44] = 104'h3be56129ca421b4f2517a8d907;
      expv[45] = 104'h7b13dcad624c7c381c4a3871b4;
      expv[46] = 104'h987d162677f41fd0f2e5d70971;
      expv[47] = 104'h4a81d79b516038108558b228ca;
      expv[48] = 104'hdf1df466c1f1ce30a76befebee;
      expv[49] = 104'h9185ead06a3d1839a83ec528d1;
      expv[50] = 104'h8dcb0d9838cd2c8e8bc6537917;
      expv[51] = 104'h7313709c5646de017c8da65a48;
      expv[52] = 104'hca501d5867fec89b4d6d387b23;
      expv[53] = 104'h012bc74abb6b2130298131e1c9;
      expv[54] = 104'h0f36afed926124abe8a80e3921;
      expv[55] = 104'hb926c83f5b86213124b971b536;
      expv[56] = 104'h7f19366bef5a4cab700cc22b7f;
      expv[57] = 104'h199b2e7d6f2e700411aebab480;
      expv[58] = 104'h46690f0d09216c681c17355a2c;
      expv[59] = 104'h200cbb674310ec0ed3e5d20060;
      expv[60] = 104'h51b9a4e7e8be9aa9f82afbf1f3;
      expv[61] = 104'h59cb29b37f419f7abe65f8bc6e;
      expv[62] = 104'he30f79beb729f7e0310cd503b9;
      expv[63] = 104'h3c1baefda7dec8ef1ffeec2a38;
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
