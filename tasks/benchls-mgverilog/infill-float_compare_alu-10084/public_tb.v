// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10084 dut (
    .sys_clk(clk),
    .alu_rst(in_vec[65:65]),
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .valid_i(in_vec[0:0]),
    .r(out_vec[32:1]),
    .valid_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3ccafe7d4cb8409cc;
    stim[1] = 66'h30c59421bf2cbb4f1;
    stim[2] = 66'h1768dfdc17899067b;
    stim[3] = 66'h0e372903cd1d4c2b1;
    stim[4] = 66'h0b8b3c8f980a0b2f4;
    stim[5] = 66'h162a145858d7b4a9b;
    stim[6] = 66'h154b2883c083e714a;
    stim[7] = 66'h108e1b5dfa354a4f2;
    stim[8] = 66'h0ddb8b871d8650e81;
    stim[9] = 66'h0f30c0cb77386fbf0;
    stim[10] = 66'h02d6a543eed0d0310;
    stim[11] = 66'h1119e86e35099e12d;
    stim[12] = 66'h0d9d1600d94e21300;
    stim[13] = 66'h0d439c8309a9f8eac;
    stim[14] = 66'h12319730104968caf;
    stim[15] = 66'h0c04df826838cc848;
    stim[16] = 66'h0b83b9354c6b0714c;
    stim[17] = 66'h1fff063d38f99a832;
    stim[18] = 66'h1a5016b5e91053967;
    stim[19] = 66'h012165bed11ca0c6c;
    stim[20] = 66'h14cb4c2b0c6be9dbe;
    stim[21] = 66'h08e18e60c3f610508;
    stim[22] = 66'h138b7213ff121588c;
    stim[23] = 66'h09c97dfd131e83227;
    stim[24] = 66'h18ff29bcf60ea7a75;
    stim[25] = 66'h06607185a717b3ca5;
    stim[26] = 66'h02acf8321f60b54bd;
    stim[27] = 66'h1fe6953f112647ff2;
    stim[28] = 66'h151de352e8327655f;
    stim[29] = 66'h0bad03857663f3cc2;
    stim[30] = 66'h17cc02f1649aa833a;
    stim[31] = 66'h0279fbe4e53bd640b;
    stim[32] = 66'h1a51ed2a5100b74d1;
    stim[33] = 66'h17fb1919b0be6f696;
    stim[34] = 66'h02df805673b711e49;
    stim[35] = 66'h03a6037c45b346ad4;
    stim[36] = 66'h1aedb9dd57e303db1;
    stim[37] = 66'h0406226279d56469a;
    stim[38] = 66'h13c05b101105b5afe;
    stim[39] = 66'h058553457a69e866d;
    stim[40] = 66'h211d7f964aedd3f7e;
    stim[41] = 66'h174eed53532b99439;
    stim[42] = 66'h02600385f802728af;
    stim[43] = 66'h01cb35bb92b47dc83;
    stim[44] = 66'h03f5fdd78df879310;
    stim[45] = 66'h1ae2caa97cd032db2;
    stim[46] = 66'h07418574105618a69;
    stim[47] = 66'h117326f3ae958d3be;
    stim[48] = 66'h1b3ee3cb1afe32c61;
    stim[49] = 66'h02028288ea941908a;
    stim[50] = 66'h113aa05c189c27a12;
    stim[51] = 66'h1f8c0a3d45da46926;
    stim[52] = 66'h11c6ea22da2191f7d;
    stim[53] = 66'h1594fceb4bc5e8c82;
    stim[54] = 66'h13860dc015dc1767b;
    stim[55] = 66'h19ffe0c5e6f6216d1;
    stim[56] = 66'h1ca70bca4564c02d0;
    stim[57] = 66'h0a15f7b88f9be56fa;
    stim[58] = 66'h06d3de52a05e778ee;
    stim[59] = 66'h1039a22223650672c;
    stim[60] = 66'h142a0bb399785a5be;
    stim[61] = 66'h05bb9ac3cbff78407;
    stim[62] = 66'h110a037baf445909e;
    stim[63] = 66'h1a4172ac740104bc3;
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
      expv[0] = 33'h0xx00000x;
      expv[1] = 33'h000000000;
      expv[2] = 33'h07f000000;
      expv[3] = 33'h07f000001;
      expv[4] = 33'h07f000001;
      expv[5] = 33'h07f000000;
      expv[6] = 33'h07f000001;
      expv[7] = 33'h000000000;
      expv[8] = 33'h07f000000;
      expv[9] = 33'h07f000001;
      expv[10] = 33'h07f000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h07f000001;
      expv[13] = 33'h07f000000;
      expv[14] = 33'h07f000000;
      expv[15] = 33'h000000001;
      expv[16] = 33'h07f000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000001;
      expv[20] = 33'h07f000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h07f000000;
      expv[23] = 33'h07f000000;
      expv[24] = 33'h07f000001;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h07f000001;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000001;
      expv[30] = 33'h07f000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000000;
      expv[35] = 33'h07f000001;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000001;
      expv[38] = 33'h07f000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h07f000001;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000001;
      expv[43] = 33'h07f000001;
      expv[44] = 33'h07f000001;
      expv[45] = 33'h000000000;
      expv[46] = 33'h07f000000;
      expv[47] = 33'h07f000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000000;
      expv[51] = 33'h07f000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h07f000001;
      expv[54] = 33'h000000000;
      expv[55] = 33'h07f000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h07f000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h07f000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
