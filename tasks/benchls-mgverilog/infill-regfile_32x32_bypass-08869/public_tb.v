// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08869 dut (
    .clk(clk),
    .rst(in_vec[48:48]),
    .raddr1(in_vec[47:43]),
    .raddr2(in_vec[42:38]),
    .rf_write(in_vec[37:37]),
    .waddr(in_vec[36:32]),
    .data(in_vec[31:0]),
    .rd_data1(out_vec[63:32]),
    .rd_data2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h183f827fc4b7e;
    stim[1] = 49'h1bd3bac590d40;
    stim[2] = 49'h0a9bdb55940c1;
    stim[3] = 49'h0a0ab194f9b7b;
    stim[4] = 49'h06fc7ef49ee66;
    stim[5] = 49'h095e1e40a459b;
    stim[6] = 49'h02aa96e9f5949;
    stim[7] = 49'h0844dac060e03;
    stim[8] = 49'h0ab51007ba47b;
    stim[9] = 49'h0a8df53cb0353;
    stim[10] = 49'h04977d6212b98;
    stim[11] = 49'h0e7796e7e48f4;
    stim[12] = 49'h0757977131497;
    stim[13] = 49'h073db648fc4e4;
    stim[14] = 49'h00ef629a42a71;
    stim[15] = 49'h0721b40cab6f8;
    stim[16] = 49'h04d3184aa29cc;
    stim[17] = 49'h09670b2937720;
    stim[18] = 49'h04a35350c083d;
    stim[19] = 49'h0080e09236e39;
    stim[20] = 49'h0ab7a80a23d53;
    stim[21] = 49'h00b9ff338afb3;
    stim[22] = 49'h0632506b31e07;
    stim[23] = 49'h0ccef5e1c6bf9;
    stim[24] = 49'h0d5e8c3d9ed69;
    stim[25] = 49'h0dc2d6ca9436a;
    stim[26] = 49'h07a73a6192d54;
    stim[27] = 49'h03cb1605745ac;
    stim[28] = 49'h096be294ce771;
    stim[29] = 49'h0d95178e71b33;
    stim[30] = 49'h090d4dbae7bde;
    stim[31] = 49'h089afeee2cd54;
    stim[32] = 49'h0bbdc9c676c23;
    stim[33] = 49'h023f4c3fcb521;
    stim[34] = 49'h0f4351797e64f;
    stim[35] = 49'h0754c1c26bc40;
    stim[36] = 49'h0893ecd1bdfaa;
    stim[37] = 49'h0495175bd99e9;
    stim[38] = 49'h0a5dd8867c265;
    stim[39] = 49'h0c88a3d1754ee;
    stim[40] = 49'h036f7719dbd6f;
    stim[41] = 49'h00326b7a27368;
    stim[42] = 49'h00b52e4da2ced;
    stim[43] = 49'h0076f2f083228;
    stim[44] = 49'h0516725a192bc;
    stim[45] = 49'h0983c878426b6;
    stim[46] = 49'h06e245648082c;
    stim[47] = 49'h0e150e9ba9b8b;
    stim[48] = 49'h051932e10aac0;
    stim[49] = 49'h08d1009067ea8;
    stim[50] = 49'h0f2abe9df3c30;
    stim[51] = 49'h03afe5648e06f;
    stim[52] = 49'h0102fd261190b;
    stim[53] = 49'h0bf131c3a6a01;
    stim[54] = 49'h03c4f0225dbc1;
    stim[55] = 49'h0bd2616e85d7c;
    stim[56] = 49'h05cea676a53f6;
    stim[57] = 49'h0746eeb7cf8b1;
    stim[58] = 49'h0ba58f074ca7a;
    stim[59] = 49'h09bc2bc782a3a;
    stim[60] = 49'h0bc3c6e2c1fdc;
    stim[61] = 49'h0983f02bcef13;
    stim[62] = 49'h03fab83a459df;
    stim[63] = 49'h05e91dd1350c6;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxac590d40;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxx00000000;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hac590d40xxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hac590d40xxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxac590d40;
      expv[41] = 64'h00000000xxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'h00000000xxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxx00000000;
      expv[46] = 64'hxxxxxxxx27fc4b7e;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxx00000000;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'heb7cf8b1xxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxx00000000;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
