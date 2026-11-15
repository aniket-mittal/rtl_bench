// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 136;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029245 dut (
    .Clk(clk),
    .R_Addr(in_vec[18:15]),
    .W_Addr(in_vec[14:11]),
    .Rst(in_vec[10:10]),
    .R_en(in_vec[9:9]),
    .W_en(in_vec[8:8]),
    .W_Data(in_vec[7:0]),
    .R_Data(out_vec[135:128]),
    .debug_Reg0(out_vec[127:120]),
    .debug_Reg1(out_vec[119:112]),
    .debug_Reg2(out_vec[111:104]),
    .debug_Reg3(out_vec[103:96]),
    .debug_Reg4(out_vec[95:88]),
    .debug_Reg5(out_vec[87:80]),
    .debug_Reg6(out_vec[79:72]),
    .debug_Reg7(out_vec[71:64]),
    .debug_Reg8(out_vec[63:56]),
    .debug_Reg9(out_vec[55:48]),
    .debug_Reg10(out_vec[47:40]),
    .debug_Reg11(out_vec[39:32]),
    .debug_Reg12(out_vec[31:24]),
    .debug_Reg13(out_vec[23:16]),
    .debug_Reg14(out_vec[15:8]),
    .debug_Reg15(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h2ce1b;
    stim[1] = 19'h2572b;
    stim[2] = 19'h6d1e2;
    stim[3] = 19'h348f7;
    stim[4] = 19'h5b982;
    stim[5] = 19'h31af0;
    stim[6] = 19'h5a0b0;
    stim[7] = 19'h1ca0b;
    stim[8] = 19'h0c03b;
    stim[9] = 19'h362ad;
    stim[10] = 19'h52210;
    stim[11] = 19'h42257;
    stim[12] = 19'h2d8a1;
    stim[13] = 19'h2b86a;
    stim[14] = 19'h1f37e;
    stim[15] = 19'h2c28e;
    stim[16] = 19'h5699c;
    stim[17] = 19'h1d2ed;
    stim[18] = 19'h35096;
    stim[19] = 19'h11ac8;
    stim[20] = 19'h4d16e;
    stim[21] = 19'h7aad4;
    stim[22] = 19'h301f3;
    stim[23] = 19'h319f5;
    stim[24] = 19'h1596c;
    stim[25] = 19'h370a6;
    stim[26] = 19'h4b313;
    stim[27] = 19'h6a27a;
    stim[28] = 19'h05106;
    stim[29] = 19'h4b3e6;
    stim[30] = 19'h5c056;
    stim[31] = 19'h6fa11;
    stim[32] = 19'h64bd2;
    stim[33] = 19'h073ad;
    stim[34] = 19'h6b8ef;
    stim[35] = 19'h2487c;
    stim[36] = 19'h1a163;
    stim[37] = 19'h5cac9;
    stim[38] = 19'h20bac;
    stim[39] = 19'h2ea9c;
    stim[40] = 19'h022bf;
    stim[41] = 19'h71b5d;
    stim[42] = 19'h210b3;
    stim[43] = 19'h169ab;
    stim[44] = 19'h64af2;
    stim[45] = 19'h38011;
    stim[46] = 19'h49b8d;
    stim[47] = 19'h1c1bb;
    stim[48] = 19'h60805;
    stim[49] = 19'h6f8f4;
    stim[50] = 19'h06bfe;
    stim[51] = 19'h381aa;
    stim[52] = 19'h676cd;
    stim[53] = 19'h71884;
    stim[54] = 19'h7c31c;
    stim[55] = 19'h67279;
    stim[56] = 19'h121d1;
    stim[57] = 19'h3d2ba;
    stim[58] = 19'h7e206;
    stim[59] = 19'h61081;
    stim[60] = 19'h16314;
    stim[61] = 19'h2a354;
    stim[62] = 19'h2181d;
    stim[63] = 19'h39956;
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
      expv[0] = 136'h5500112233445566778899aabbccddeeff;
      expv[1] = 136'h4400112233445566778899aabbccddeeff;
      expv[2] = 136'hxx00112233445566778899aabbccddeeff;
      expv[3] = 136'hxx00112233445566778899e2bbccddeeff;
      expv[4] = 136'hxx00112233445566778899e2bbccddeeff;
      expv[5] = 136'h6600112233445566828899e2bbccddeeff;
      expv[6] = 136'hxx00112233445566828899e2bbccddeeff;
      expv[7] = 136'h3300112233445566828899e2bbccddeeff;
      expv[8] = 136'hxx00112233445566828899e2bbccddeeff;
      expv[9] = 136'h6600112233445566828899e2bbccddeeff;
      expv[10] = 136'he200112233445566828899e2bbccddeeff;
      expv[11] = 136'h8800112233445566828899e2bbccddeeff;
      expv[12] = 136'hxx00112233445566828899e2bbccddeeff;
      expv[13] = 136'hxx00112233445566828899e2bbccddeeff;
      expv[14] = 136'h3300112233445566828899e2bbccddeeff;
      expv[15] = 136'h5500112233445566828899e2bbccdd7eff;
      expv[16] = 136'hxx00112233445566828899e2bbccdd7eff;
      expv[17] = 136'h3300112233445566828899e2bbcc9c7eff;
      expv[18] = 136'hxx00112233445566828899e2bbcc9c7eff;
      expv[19] = 136'h2200112233445566828899e2bbcc9c7eff;
      expv[20] = 136'hxx00112233445566828899e2bbcc9c7eff;
      expv[21] = 136'hff001122334455668288996ebbcc9c7eff;
      expv[22] = 136'hxx001122334455668288996ebbcc9c7eff;
      expv[23] = 136'hxxf31122334455668288996ebbcc9c7eff;
      expv[24] = 136'hxxf31122f54455668288996ebbcc9c7eff;
      expv[25] = 136'hxxf31122f54455668288996e6ccc9c7eff;
      expv[26] = 136'h99f31122f54455668288996e6ccc9c7eff;
      expv[27] = 136'h9cf31122f54455138288996e6ccc9c7eff;
      expv[28] = 136'hxxf31122f54455138288996e6ccc9c7eff;
      expv[29] = 136'h99f31122f5445513828899066ccc9c7eff;
      expv[30] = 136'hxxf31122f54455e6828899066ccc9c7eff;
      expv[31] = 136'h9cf31122f54455e6828899066ccc9c7eff;
      expv[32] = 136'hccf31122f54455e6828899066ccc9c7eff;
      expv[33] = 136'hf3f31122f54455e68288d2066ccc9c7eff;
      expv[34] = 136'hxxf31122f54455e68288d2066ccc9cadff;
      expv[35] = 136'hxxf31122f54455e68288d2066ccc9cadff;
      expv[36] = 136'hxxf31122f54455e68288d2066ccc9cadff;
      expv[37] = 136'h6cf31122f56355e68288d2066ccc9cadff;
      expv[38] = 136'h63f31122f56355e68288d2066ccc9cadff;
      expv[39] = 136'h55f3ac22f56355e68288d2066ccc9cadff;
      expv[40] = 136'hf3f3ac22f56355e68288d2066ccc9cadff;
      expv[41] = 136'hadf3ac22f56355e68288d2066ccc9cadff;
      expv[42] = 136'hxxf3ac225d6355e68288d2066ccc9cadff;
      expv[43] = 136'hxxf3ac225d6355e68288d2066ccc9cadff;
      expv[44] = 136'hccf3ac225d6355e68288d2066cccabadff;
      expv[45] = 136'hxxf3ac225d6355e68288d2066cccabadff;
      expv[46] = 136'hd2f3ac225d6355e68288d2066cccabadff;
      expv[47] = 136'hxxf3ac228d6355e68288d2066cccabadff;
      expv[48] = 136'hxxf3ac228d6355e682bbd2066cccabadff;
      expv[49] = 136'hxxf3ac228d6355e682bbd2066cccabadff;
      expv[50] = 136'hf3f3ac228d6355e682bbd2066cccabadff;
      expv[51] = 136'hxxf3ac228d6355e682bbd2066cccfeadff;
      expv[52] = 136'hcc00112233445566778899aabbccddeeff;
      expv[53] = 136'hxx00112233445566778899aabbccddeeff;
      expv[54] = 136'hff00112233445566778899aabbccddeeff;
      expv[55] = 136'hcc00112233445566771c99aabbccddeeff;
      expv[56] = 136'hxx00112233445566771c99aabbccddeeff;
      expv[57] = 136'h7700112233d15566771c99aabbccddeeff;
      expv[58] = 136'hff00112233d15566771c99aabbccddeeff;
      expv[59] = 136'hxx00112233d15566771c99aabbccddeeff;
      expv[60] = 136'h2200112233d15566771c99aabbccddeeff;
      expv[61] = 136'h5500112233d15566771c99aabb14ddeeff;
      expv[62] = 136'hxx00112233545566771c99aabb14ddeeff;
      expv[63] = 136'hxx00112233545566771c99aabb14ddeeff;
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
