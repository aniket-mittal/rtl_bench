// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03871 dut (
    .CLK(clk),
    .RESET_N(in_vec[22:22]),
    .CMD(in_vec[21:19]),
    .ADDR(in_vec[18:3]),
    .REF_ACK(in_vec[2:2]),
    .INIT_ACK(in_vec[1:1]),
    .CM_ACK(in_vec[0:0]),
    .NOP(out_vec[24:24]),
    .READA(out_vec[23:23]),
    .WRITEA(out_vec[22:22]),
    .REFRESH(out_vec[21:21]),
    .PRECHARGE(out_vec[20:20]),
    .LOAD_MODE(out_vec[19:19]),
    .SADDR(out_vec[18:3]),
    .REF_REQ(out_vec[2:2]),
    .INIT_REQ(out_vec[1:1]),
    .CMD_ACK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h22d486;
    stim[1] = 23'h030619;
    stim[2] = 23'h5684a9;
    stim[3] = 23'h7a9fc0;
    stim[4] = 23'h6eb435;
    stim[5] = 23'h4aac29;
    stim[6] = 23'h44cc35;
    stim[7] = 23'h5be322;
    stim[8] = 23'h6d9258;
    stim[9] = 23'h6584ab;
    stim[10] = 23'h64c44b;
    stim[11] = 23'h5030df;
    stim[12] = 23'h6dfb55;
    stim[13] = 23'h72f452;
    stim[14] = 23'h60552a;
    stim[15] = 23'h4bde76;
    stim[16] = 23'h4cd707;
    stim[17] = 23'h0928e2;
    stim[18] = 23'h56d747;
    stim[19] = 23'h479e55;
    stim[20] = 23'h441029;
    stim[21] = 23'h61110e;
    stim[22] = 23'h6f689b;
    stim[23] = 23'h56b93d;
    stim[24] = 23'h6d77ca;
    stim[25] = 23'h741d62;
    stim[26] = 23'h6837f5;
    stim[27] = 23'h63b49e;
    stim[28] = 23'h45bf8d;
    stim[29] = 23'h7018a6;
    stim[30] = 23'h63a89d;
    stim[31] = 23'h725c74;
    stim[32] = 23'h4c57aa;
    stim[33] = 23'h56e26c;
    stim[34] = 23'h77b36d;
    stim[35] = 23'h670e08;
    stim[36] = 23'h6143a1;
    stim[37] = 23'h57985b;
    stim[38] = 23'h5bed68;
    stim[39] = 23'h6e02c6;
    stim[40] = 23'h4ad4f7;
    stim[41] = 23'h637f9e;
    stim[42] = 23'h4bafb4;
    stim[43] = 23'h7f457d;
    stim[44] = 23'h6a1350;
    stim[45] = 23'h7ac1b0;
    stim[46] = 23'h7e5c98;
    stim[47] = 23'h7a70e2;
    stim[48] = 23'h581066;
    stim[49] = 23'h79c187;
    stim[50] = 23'h64abd5;
    stim[51] = 23'h40dc5a;
    stim[52] = 23'h6addad;
    stim[53] = 23'h662237;
    stim[54] = 23'h5e80d4;
    stim[55] = 23'h5d6210;
    stim[56] = 23'h72fc94;
    stim[57] = 23'h45663d;
    stim[58] = 23'h4b90a7;
    stim[59] = 23'h754331;
    stim[60] = 23'h70f593;
    stim[61] = 23'h4a39c0;
    stim[62] = 23'h436dc5;
    stim[63] = 23'h695c6e;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h04684af;
      expv[4] = 25'h0029fc2;
      expv[5] = 25'h006b433;
      expv[6] = 25'h082ac2a;
      expv[7] = 25'h104cc33;
      expv[8] = 25'h003e322;
      expv[9] = 25'h005925a;
      expv[10] = 25'h00584ab;
      expv[11] = 25'h004c44a;
      expv[12] = 25'h04030db;
      expv[13] = 25'h005fb52;
      expv[14] = 25'h002f452;
      expv[15] = 25'h000552a;
      expv[16] = 25'h083de72;
      expv[17] = 25'h0000000;
      expv[18] = 25'h0000000;
      expv[19] = 25'h046d747;
      expv[20] = 25'h1079e52;
      expv[21] = 25'h104102b;
      expv[22] = 25'h001110a;
      expv[23] = 25'h007689b;
      expv[24] = 25'h046b93a;
      expv[25] = 25'h00577ca;
      expv[26] = 25'h0041d62;
      expv[27] = 25'h00037f3;
      expv[28] = 25'h003b49a;
      expv[29] = 25'h105bf8b;
      expv[30] = 25'h00018a2;
      expv[31] = 25'h003a89b;
      expv[32] = 25'h0025c72;
      expv[33] = 25'h08457aa;
      expv[34] = 25'h046e26a;
      expv[35] = 25'h007b36b;
      expv[36] = 25'h0070e0a;
      expv[37] = 25'h00143a3;
      expv[38] = 25'h047985a;
      expv[39] = 25'h003ed6a;
      expv[40] = 25'h00602c2;
      expv[41] = 25'h082d4f3;
      expv[42] = 25'h0037f9a;
      expv[43] = 25'h083afb2;
      expv[44] = 25'h007457b;
      expv[45] = 25'h0021352;
      expv[46] = 25'h002c1b2;
      expv[47] = 25'h0065c9a;
      expv[48] = 25'h00270e2;
      expv[49] = 25'h0001062;
      expv[50] = 25'h001c183;
      expv[51] = 25'h004abd2;
      expv[52] = 25'h100dc5a;
      expv[53] = 25'h002ddab;
      expv[54] = 25'h0062232;
      expv[55] = 25'h00680d2;
      expv[56] = 25'h0056212;
      expv[57] = 25'h002fc92;
      expv[58] = 25'h105663b;
      expv[59] = 25'h08390a2;
      expv[60] = 25'h0054333;
      expv[61] = 25'h000f592;
      expv[62] = 25'h08239c2;
      expv[63] = 25'h1036dc3;
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
