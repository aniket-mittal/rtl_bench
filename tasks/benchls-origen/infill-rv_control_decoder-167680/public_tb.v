// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167680 dut (
    .inst(in_vec[36:32]),
    .full(in_vec[31:0]),
    .ALUop(out_vec[12:11]),
    .branch(out_vec[10:10]),
    .memRead(out_vec[9:9]),
    .memToReg(out_vec[8:8]),
    .memWrite(out_vec[7:7]),
    .ALUsrc(out_vec[6:6]),
    .RegWrite(out_vec[5:5]),
    .jump(out_vec[4:4]),
    .auipc(out_vec[3:3]),
    .outnew(out_vec[2:2]),
    .jal(out_vec[1:1]),
    .flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0a4c804993;
    stim[1] = 37'h0567bec464;
    stim[2] = 37'h023cdcff19;
    stim[3] = 37'h09e76b7c43;
    stim[4] = 37'h139a21e8e6;
    stim[5] = 37'h0068e520ee;
    stim[6] = 37'h1609fd8c93;
    stim[7] = 37'h1f64fb4ff8;
    stim[8] = 37'h09bec99c9a;
    stim[9] = 37'h11a8b63f1e;
    stim[10] = 37'h116f7db77e;
    stim[11] = 37'h17176d143d;
    stim[12] = 37'h11e1103b65;
    stim[13] = 37'h0a45b4f178;
    stim[14] = 37'h100c86a1b1;
    stim[15] = 37'h130ae38ec1;
    stim[16] = 37'h083f7b762b;
    stim[17] = 37'h18e2367a62;
    stim[18] = 37'h1f9c9bee15;
    stim[19] = 37'h12fd62e689;
    stim[20] = 37'h147357af92;
    stim[21] = 37'h16e319d792;
    stim[22] = 37'h030289a6c1;
    stim[23] = 37'h0b51afa41a;
    stim[24] = 37'h02c8294c7a;
    stim[25] = 37'h08309cbda9;
    stim[26] = 37'h1c84cf81cf;
    stim[27] = 37'h0cb82ee985;
    stim[28] = 37'h0592624579;
    stim[29] = 37'h183426158a;
    stim[30] = 37'h0bfe2c71c9;
    stim[31] = 37'h0eaa257015;
    stim[32] = 37'h1089ec29d0;
    stim[33] = 37'h0f15b228d2;
    stim[34] = 37'h1429d2c89c;
    stim[35] = 37'h095d8acdef;
    stim[36] = 37'h0c408d80cc;
    stim[37] = 37'h192be6f50d;
    stim[38] = 37'h0c66c7fffb;
    stim[39] = 37'h0d36fa5bd5;
    stim[40] = 37'h1ebb620114;
    stim[41] = 37'h0ff44f0f0f;
    stim[42] = 37'h07e77d248b;
    stim[43] = 37'h1593554fa2;
    stim[44] = 37'h1445993669;
    stim[45] = 37'h0e479740af;
    stim[46] = 37'h0bb4a5e064;
    stim[47] = 37'h144656b993;
    stim[48] = 37'h0459f390a4;
    stim[49] = 37'h1c1a713d2c;
    stim[50] = 37'h0b7143318a;
    stim[51] = 37'h1851c16939;
    stim[52] = 37'h186d64a1d2;
    stim[53] = 37'h19defffe5b;
    stim[54] = 37'h1745a35892;
    stim[55] = 37'h1e4351ed63;
    stim[56] = 37'h073e6adf02;
    stim[57] = 37'h1cd710ecb1;
    stim[58] = 37'h1e3a6e388b;
    stim[59] = 37'h0cea9628e9;
    stim[60] = 37'h08d8c2b988;
    stim[61] = 37'h145d25fb68;
    stim[62] = 37'h124d59c50c;
    stim[63] = 37'h04a400c6b9;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0068;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0360;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h00c0;
      expv[17] = 13'h0c00;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h00c0;
      expv[26] = 13'h0005;
      expv[27] = 13'h1020;
      expv[28] = 13'h0068;
      expv[29] = 13'h0c00;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h1020;
      expv[37] = 13'h0070;
      expv[38] = 13'h1020;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0060;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0c00;
      expv[52] = 13'h0c00;
      expv[53] = 13'h0070;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h1020;
      expv[60] = 13'h00c0;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0060;
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
