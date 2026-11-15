// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_194536 dut (
    .clk(clk),
    .reset(in_vec[68:68]),
    .rd_d_in(in_vec[67:52]),
    .rs1_d(in_vec[51:36]),
    .rs2_d(in_vec[35:20]),
    .ALU_Sel(in_vec[19:16]),
    .count(in_vec[15:9]),
    .reg_write(in_vec[8:8]),
    .q0_var(in_vec[7:7]),
    .q1_var(in_vec[6:6]),
    .LENGTH(in_vec[5:0]),
    .OpStart(out_vec[16:16]),
    .rd_d_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h120e3ca90f1318ff33;
    stim[1] = 69'h18830099f1a0a096a4;
    stim[2] = 69'h08a6a0f1439a57763b;
    stim[3] = 69'h0d0bf888fe8049877e;
    stim[4] = 69'h04fa7c6c2fb288fc64;
    stim[5] = 69'h0a233416db33ce22ee;
    stim[6] = 69'h0a4ae947b0098cae0b;
    stim[7] = 69'h0586eff52caaa746d6;
    stim[8] = 69'h0fde102dbe025a7904;
    stim[9] = 69'h005ae72693394b2bb5;
    stim[10] = 69'h031057002ca0f075c4;
    stim[11] = 69'h08b611d63a2970ee4b;
    stim[12] = 69'h0cf3369c43738ace28;
    stim[13] = 69'h0db3367f2b6359c0f0;
    stim[14] = 69'h0f299af7ffe12f61e6;
    stim[15] = 69'h016e4645e41af3bcb1;
    stim[16] = 69'h049eae9e7ea1d8cee4;
    stim[17] = 69'h01a32f5198e2ec33b7;
    stim[18] = 69'h05d441afb4fefcb1de;
    stim[19] = 69'h08f2a37eefcac64f64;
    stim[20] = 69'h0536094880a7a8fa5f;
    stim[21] = 69'h0c6c4b359b1e785ddc;
    stim[22] = 69'h04de0f58decd662854;
    stim[23] = 69'h04721dd7ab6d7f78f0;
    stim[24] = 69'h08e0522aa52f4f4a9a;
    stim[25] = 69'h04cd8c76d89485eb06;
    stim[26] = 69'h09cad9723e0550a2ea;
    stim[27] = 69'h01e57b46798dff0cb1;
    stim[28] = 69'h0441fa5ff9d78af5f4;
    stim[29] = 69'h089b16cbf24f1aa2c4;
    stim[30] = 69'h0564a705c6dfc0df0f;
    stim[31] = 69'h0be487d354daef583d;
    stim[32] = 69'h01a22976e1072db232;
    stim[33] = 69'h055138fa6a0aeeb56d;
    stim[34] = 69'h073c718313ceac72f1;
    stim[35] = 69'h050e7d3ccf513bdf51;
    stim[36] = 69'h0b7e3459a98976eaaa;
    stim[37] = 69'h0b4083eced51df9b00;
    stim[38] = 69'h0b6dead72e843144dc;
    stim[39] = 69'h0855a4d9c8b9b97d1b;
    stim[40] = 69'h0c7761ad5ab502b18d;
    stim[41] = 69'h00cf502865e8d9a201;
    stim[42] = 69'h07b9dec6276dfeb669;
    stim[43] = 69'h0bdeb0987fcccb37ef;
    stim[44] = 69'h0c57df3c252c4d8e4b;
    stim[45] = 69'h0c85f9668d4bc2731b;
    stim[46] = 69'h06b819733eb3dcbf12;
    stim[47] = 69'h1f57da34c8525a14d0;
    stim[48] = 69'h0df2b7eb1942713bd1;
    stim[49] = 69'h0a9d196b5fcaf8aab3;
    stim[50] = 69'h078b7504f205aab6f7;
    stim[51] = 69'h0ba861858ea3ef20e3;
    stim[52] = 69'h00d662abdbb4c09a2b;
    stim[53] = 69'h0dfcd4d031644a6b7f;
    stim[54] = 69'h003e5e22e6043e1d62;
    stim[55] = 69'h0af5f03f9900a3d7ee;
    stim[56] = 69'h00a7aa2189985c5315;
    stim[57] = 69'h00d356225b7ebc3dd4;
    stim[58] = 69'h0cd3d25df99a05c6ff;
    stim[59] = 69'h04c6f6912b825f8599;
    stim[60] = 69'h0d9ec3d319ab439b9c;
    stim[61] = 69'h0b5d2cb4db437d00ba;
    stim[62] = 69'h04a3c0c602c2fedfbf;
    stim[63] = 69'h0a7eb894720091e42e;
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
      expv[0] = 17'h0xxxx;
      expv[1] = 17'h0xxxx;
      expv[2] = 17'h0xxxx;
      expv[3] = 17'h0xxxx;
      expv[4] = 17'h0xxxx;
      expv[5] = 17'h0xxxx;
      expv[6] = 17'h0xxxx;
      expv[7] = 17'h0xxxx;
      expv[8] = 17'h0xxxx;
      expv[9] = 17'h0xxxx;
      expv[10] = 17'h0xxxx;
      expv[11] = 17'h1xxxx;
      expv[12] = 17'h0xxxx;
      expv[13] = 17'h0xxxx;
      expv[14] = 17'h0xxxx;
      expv[15] = 17'h0xxxx;
      expv[16] = 17'h0xxxx;
      expv[17] = 17'h0xxxx;
      expv[18] = 17'h0xxxx;
      expv[19] = 17'h0xxxx;
      expv[20] = 17'h0xxxx;
      expv[21] = 17'h0xxxx;
      expv[22] = 17'h0xxxx;
      expv[23] = 17'h0xxxx;
      expv[24] = 17'h0xxxx;
      expv[25] = 17'h0xxxx;
      expv[26] = 17'h0xxxx;
      expv[27] = 17'h1xxxx;
      expv[28] = 17'h0xxxx;
      expv[29] = 17'h0xxxx;
      expv[30] = 17'h0xxxx;
      expv[31] = 17'h1xxxx;
      expv[32] = 17'h0xxxx;
      expv[33] = 17'h0xxxx;
      expv[34] = 17'h0xxxx;
      expv[35] = 17'h0xxxx;
      expv[36] = 17'h0xxxx;
      expv[37] = 17'h0xxxx;
      expv[38] = 17'h0xxxx;
      expv[39] = 17'h1xxxx;
      expv[40] = 17'h0xxxx;
      expv[41] = 17'h0xxxx;
      expv[42] = 17'h0xxxx;
      expv[43] = 17'h0xxxx;
      expv[44] = 17'h0xxxx;
      expv[45] = 17'h0xxxx;
      expv[46] = 17'h1xxxx;
      expv[47] = 17'h0xxxx;
      expv[48] = 17'h0xxxx;
      expv[49] = 17'h1xxxx;
      expv[50] = 17'h0xxxx;
      expv[51] = 17'h0xxxx;
      expv[52] = 17'h0xxxx;
      expv[53] = 17'h1xxxx;
      expv[54] = 17'h0xxxx;
      expv[55] = 17'h0xxxx;
      expv[56] = 17'h0xxxx;
      expv[57] = 17'h0xxxx;
      expv[58] = 17'h0xxxx;
      expv[59] = 17'h0xxxx;
      expv[60] = 17'h0xxxx;
      expv[61] = 17'h0xxxx;
      expv[62] = 17'h0xxxx;
      expv[63] = 17'h0xxxx;
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
