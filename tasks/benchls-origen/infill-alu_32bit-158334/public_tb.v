// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158334 dut (
    .in1(in_vec[72:41]),
    .in2(in_vec[40:9]),
    .control(in_vec[8:5]),
    .SHAMT(in_vec[4:0]),
    .out(out_vec[33:2]),
    .ov(out_vec[1:1]),
    .zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1266085299e7717c3e4;
    stim[1] = 73'h17a1dd3d5a1863a5474;
    stim[2] = 73'h0898b5248ed0714a230;
    stim[3] = 73'h0cda7eca5e76c90e409;
    stim[4] = 73'h1d3a1d45bfc13a4d017;
    stim[5] = 73'h1cce8c984544d9ad78f;
    stim[6] = 73'h17d39411ab428e24a01;
    stim[7] = 73'h13f136d676d8d39b6bf;
    stim[8] = 73'h029c87e22cc3ff051fd;
    stim[9] = 73'h03ad112953bd2861fec;
    stim[10] = 73'h08ad588fa383f3e0b51;
    stim[11] = 73'h132e2706890a17e1f6e;
    stim[12] = 73'h0e76fd9f9f19c13087b;
    stim[13] = 73'h194ae8f5ac867a2d20e;
    stim[14] = 73'h0a907394c1d699d3628;
    stim[15] = 73'h10b89b668474e1ddf44;
    stim[16] = 73'h048bcd72f58b64dfd88;
    stim[17] = 73'h07bf0be7efaf62aa346;
    stim[18] = 73'h1d7505c0455100cf47e;
    stim[19] = 73'h1d9332c435083e1b5a8;
    stim[20] = 73'h08bc2a4059bffa6df2c;
    stim[21] = 73'h16f84dfe69333ecebee;
    stim[22] = 73'h168ec596bc1a21c00ff;
    stim[23] = 73'h00e52ba443b6a7e6453;
    stim[24] = 73'h1d94196ef59c5e371dc;
    stim[25] = 73'h13e825b68423ec414cf;
    stim[26] = 73'h1f5b330f52910585c94;
    stim[27] = 73'h0be0201bba7a13e5bd1;
    stim[28] = 73'h09054e8dbe5d146c1d7;
    stim[29] = 73'h020ba2b34809d426078;
    stim[30] = 73'h127d9c5d5784f22a59c;
    stim[31] = 73'h1267a795a89aab9c3da;
    stim[32] = 73'h0581c1ddaf0714c4fb4;
    stim[33] = 73'h09405ff78c417da9837;
    stim[34] = 73'h1b5a597488acc073a41;
    stim[35] = 73'h08e99d5cc8c42e0c4ea;
    stim[36] = 73'h1c69a99064c69f66f09;
    stim[37] = 73'h07bc61a8d0eebe39c2f;
    stim[38] = 73'h0ef0b79bb53c7f27234;
    stim[39] = 73'h02f0788792d769a44bb;
    stim[40] = 73'h0faa6158b6c0ffdd066;
    stim[41] = 73'h1eccedd5f7d37853c21;
    stim[42] = 73'h1ca489494d8b95b693e;
    stim[43] = 73'h0662c140d25f24bc1ef;
    stim[44] = 73'h1599a5e90e23751d155;
    stim[45] = 73'h1b5b99434e8131d6bca;
    stim[46] = 73'h02a1fed2adc4d0957c8;
    stim[47] = 73'h107b133c3c114251605;
    stim[48] = 73'h1a3b92b5a5950f4581d;
    stim[49] = 73'h0d048c0d3d5bae990c9;
    stim[50] = 73'h07d38831bf736b79dda;
    stim[51] = 73'h0680e3314899045c0d2;
    stim[52] = 73'h09c3ec671f9c3a9975d;
    stim[53] = 73'h19e7e173a9e4d132c15;
    stim[54] = 73'h00ed6b3593e9bc48ad2;
    stim[55] = 73'h1274de138ce01dfdf8a;
    stim[56] = 73'h1c060cecb30cb580685;
    stim[57] = 73'h1367ae912131cef9b97;
    stim[58] = 73'h1f763c20d9f5c67e157;
    stim[59] = 73'h0285c9fdf9df76b631e;
    stim[60] = 73'h0a92d7b4288472d3832;
    stim[61] = 73'h045f14bed1ff807fca3;
    stim[62] = 73'h11654fba5969c24e8af;
    stim[63] = 73'h10c5e3af0f667c53252;
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
      expv[0] = 34'h000000001;
      expv[1] = 34'h3f73ff7a8;
      expv[2] = 34'h339087b4c;
      expv[3] = 34'h16a28fb10;
      expv[4] = 34'h39f6af254;
      expv[5] = 34'h000000001;
      expv[6] = 34'h062c446c8;
      expv[7] = 34'h200000000;
      expv[8] = 34'h000000001;
      expv[9] = 34'h000000001;
      expv[10] = 34'h000000001;
      expv[11] = 34'h000000001;
      expv[12] = 34'h3efffb7f0;
      expv[13] = 34'h0ba2c6458;
      expv[14] = 34'h1173b382c;
      expv[15] = 34'h000000004;
      expv[16] = 34'h000000004;
      expv[17] = 34'h000000004;
      expv[18] = 34'h3aea0b9e8;
      expv[19] = 34'h000000001;
      expv[20] = 34'h000000004;
      expv[21] = 34'h000000001;
      expv[22] = 34'h3fffffffc;
      expv[23] = 34'h014847488;
      expv[24] = 34'h3c6e00000;
      expv[25] = 34'h00004fa08;
      expv[26] = 34'h1b946d150;
      expv[27] = 34'h27cb40000;
      expv[28] = 34'h28d800000;
      expv[29] = 34'h1417ed6e8;
      expv[30] = 34'h000000001;
      expv[31] = 34'h173840000;
      expv[32] = 34'h000000004;
      expv[33] = 34'h39fdc49c0;
      expv[34] = 34'h101080e10;
      expv[35] = 34'h000474ce8;
      expv[36] = 34'h000000001;
      expv[37] = 34'h2d9b46de0;
      expv[38] = 34'h336870e90;
      expv[39] = 34'h380000000;
      expv[40] = 34'h3fd5ffbb4;
      expv[41] = 34'h0df2eb044;
      expv[42] = 34'h000000004;
      expv[43] = 34'h000000001;
      expv[44] = 34'h000000004;
      expv[45] = 34'h23ad40000;
      expv[46] = 34'h212ac0000;
      expv[47] = 34'h1918ab1b0;
      expv[48] = 34'h3fa143f64;
      expv[49] = 34'h000d048c0;
      expv[50] = 34'h16f380000;
      expv[51] = 34'h000003404;
      expv[52] = 34'h000000001;
      expv[53] = 34'h0799654cc;
      expv[54] = 34'h000000768;
      expv[55] = 34'h000000001;
      expv[56] = 34'h1e1572d98;
      expv[57] = 34'h000000001;
      expv[58] = 34'h000000001;
      expv[59] = 34'h000000001;
      expv[60] = 34'h041cc9c14;
      expv[61] = 34'h05f14bec0;
      expv[62] = 34'h0fba40000;
      expv[63] = 34'h0088c0060;
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
