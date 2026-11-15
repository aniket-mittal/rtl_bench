// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_008552 dut (
    .Instr(in_vec[31:0]),
    .RegDst(out_vec[20:20]),
    .AluSrc(out_vec[19:19]),
    .RegWrite(out_vec[18:18]),
    .MemWrite(out_vec[17:17]),
    .MemToReg(out_vec[16:16]),
    .Jump(out_vec[15:15]),
    .Link(out_vec[14:14]),
    .LinkReg(out_vec[13:13]),
    .Return(out_vec[12:12]),
    .Byte(out_vec[11:11]),
    .Half(out_vec[10:10]),
    .Sign(out_vec[9:9]),
    .ExtCtrl(out_vec[8:7]),
    .Branch(out_vec[6:4]),
    .AluCtrl(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h6bd12fef;
    stim[1] = 32'hff40fd7d;
    stim[2] = 32'h74d8f8b4;
    stim[3] = 32'h0cec6049;
    stim[4] = 32'h0aa1a213;
    stim[5] = 32'hd17e47ac;
    stim[6] = 32'ha613057f;
    stim[7] = 32'h3d2b7ad3;
    stim[8] = 32'h4e54ebb9;
    stim[9] = 32'h3083e7b8;
    stim[10] = 32'h3cb5bfe8;
    stim[11] = 32'h273d3bdc;
    stim[12] = 32'h5991ef75;
    stim[13] = 32'hd3bdb13f;
    stim[14] = 32'h1f9e5300;
    stim[15] = 32'h44fb8d59;
    stim[16] = 32'h0b1db8b8;
    stim[17] = 32'hd192ea1c;
    stim[18] = 32'h60f2a199;
    stim[19] = 32'hb259a034;
    stim[20] = 32'hff91e977;
    stim[21] = 32'h18bbf707;
    stim[22] = 32'heb363135;
    stim[23] = 32'h220b1102;
    stim[24] = 32'h0e20aafe;
    stim[25] = 32'h8bebc828;
    stim[26] = 32'h10f26d0f;
    stim[27] = 32'h54bed81b;
    stim[28] = 32'hc6fe1c55;
    stim[29] = 32'h86128252;
    stim[30] = 32'h9cc91555;
    stim[31] = 32'ha4c6b563;
    stim[32] = 32'hb5cf3d05;
    stim[33] = 32'h9d1cd0d3;
    stim[34] = 32'h5cc258d1;
    stim[35] = 32'hcd33ce3d;
    stim[36] = 32'hd4458b2a;
    stim[37] = 32'h1825517a;
    stim[38] = 32'hdf011bb3;
    stim[39] = 32'h9dec9173;
    stim[40] = 32'hbb11cb20;
    stim[41] = 32'ha6437656;
    stim[42] = 32'hbbae5aad;
    stim[43] = 32'h3072f708;
    stim[44] = 32'hec13311e;
    stim[45] = 32'hd4426be6;
    stim[46] = 32'haf75fe95;
    stim[47] = 32'hffb7a69a;
    stim[48] = 32'h3fc6afa3;
    stim[49] = 32'h65c4c527;
    stim[50] = 32'he7a6b21c;
    stim[51] = 32'h75ff7a53;
    stim[52] = 32'h2eae69fe;
    stim[53] = 32'h3ced0bb9;
    stim[54] = 32'h5684c540;
    stim[55] = 32'h12feb0ff;
    stim[56] = 32'h89daffda;
    stim[57] = 32'h1f14b808;
    stim[58] = 32'hf7fd093e;
    stim[59] = 32'h9fc04acb;
    stim[60] = 32'h88ed1c49;
    stim[61] = 32'h1a6d1ccf;
    stim[62] = 32'hb376e37a;
    stim[63] = 32'h15ab3d97;
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
      expv[0] = 21'h000000;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h04c180;
      expv[4] = 21'h000000;
      expv[5] = 21'h000000;
      expv[6] = 21'h0a0482;
      expv[7] = 21'h0c0107;
      expv[8] = 21'h000000;
      expv[9] = 21'h000000;
      expv[10] = 21'h0c0107;
      expv[11] = 21'h000000;
      expv[12] = 21'h000000;
      expv[13] = 21'h000000;
      expv[14] = 21'h000000;
      expv[15] = 21'h000000;
      expv[16] = 21'h000000;
      expv[17] = 21'h000000;
      expv[18] = 21'h000000;
      expv[19] = 21'h000000;
      expv[20] = 21'h000000;
      expv[21] = 21'h000000;
      expv[22] = 21'h000000;
      expv[23] = 21'h000000;
      expv[24] = 21'h04c180;
      expv[25] = 21'h000000;
      expv[26] = 21'h000096;
      expv[27] = 21'h000000;
      expv[28] = 21'h000000;
      expv[29] = 21'h0d0682;
      expv[30] = 21'h000000;
      expv[31] = 21'h0a0482;
      expv[32] = 21'h000000;
      expv[33] = 21'h000000;
      expv[34] = 21'h000000;
      expv[35] = 21'h000000;
      expv[36] = 21'h000000;
      expv[37] = 21'h000000;
      expv[38] = 21'h000000;
      expv[39] = 21'h000000;
      expv[40] = 21'h000000;
      expv[41] = 21'h0a0482;
      expv[42] = 21'h000000;
      expv[43] = 21'h000000;
      expv[44] = 21'h000000;
      expv[45] = 21'h000000;
      expv[46] = 21'h0a0082;
      expv[47] = 21'h000000;
      expv[48] = 21'h0c0107;
      expv[49] = 21'h000000;
      expv[50] = 21'h000000;
      expv[51] = 21'h000000;
      expv[52] = 21'h000000;
      expv[53] = 21'h0c0107;
      expv[54] = 21'h000000;
      expv[55] = 21'h000096;
      expv[56] = 21'h000000;
      expv[57] = 21'h000000;
      expv[58] = 21'h000000;
      expv[59] = 21'h000000;
      expv[60] = 21'h000000;
      expv[61] = 21'h000000;
      expv[62] = 21'h000000;
      expv[63] = 21'h000000;
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
