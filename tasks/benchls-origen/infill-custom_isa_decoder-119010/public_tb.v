// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119010 dut (
    .instr(in_vec[31:0]),
    .rs(out_vec[40:35]),
    .rt(out_vec[34:29]),
    .rd(out_vec[28:23]),
    .imm(out_vec[22:8]),
    .ALUopsel(out_vec[7:4]),
    .MUXsel1(out_vec[3:3]),
    .MUXsel2(out_vec[2:2]),
    .REGwrite(out_vec[1:1]),
    .MEMwrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h1d6f5c7a;
    stim[1] = 32'h5f5b405e;
    stim[2] = 32'hdaf673f8;
    stim[3] = 32'h6d20f22f;
    stim[4] = 32'hf482dcb3;
    stim[5] = 32'h0a28d00c;
    stim[6] = 32'hff25b913;
    stim[7] = 32'heeb38383;
    stim[8] = 32'h741aa174;
    stim[9] = 32'hdd21f00e;
    stim[10] = 32'h4af688c9;
    stim[11] = 32'h97ec9509;
    stim[12] = 32'hb40aea9c;
    stim[13] = 32'h3e4ac839;
    stim[14] = 32'h72a9e1f4;
    stim[15] = 32'h35504a8a;
    stim[16] = 32'hc343a831;
    stim[17] = 32'h9110c497;
    stim[18] = 32'h251000fa;
    stim[19] = 32'h5b3c801c;
    stim[20] = 32'h5306a6db;
    stim[21] = 32'h499f91d2;
    stim[22] = 32'h5403f716;
    stim[23] = 32'h48a8d587;
    stim[24] = 32'h2023aaa5;
    stim[25] = 32'hdabd8fea;
    stim[26] = 32'hf44e2d42;
    stim[27] = 32'h237ca316;
    stim[28] = 32'hae5210de;
    stim[29] = 32'h4d8dcbc3;
    stim[30] = 32'haf819bd8;
    stim[31] = 32'h82bea38f;
    stim[32] = 32'hfacc1915;
    stim[33] = 32'ha9b9b763;
    stim[34] = 32'he7430b60;
    stim[35] = 32'h082caddc;
    stim[36] = 32'h75c18b51;
    stim[37] = 32'h143b084b;
    stim[38] = 32'h43f78734;
    stim[39] = 32'h8b6161ac;
    stim[40] = 32'h3fbebdbc;
    stim[41] = 32'h66eab121;
    stim[42] = 32'h740e19ca;
    stim[43] = 32'ha7755324;
    stim[44] = 32'hbda024ee;
    stim[45] = 32'h9ef46cce;
    stim[46] = 32'h97c5431f;
    stim[47] = 32'h1d165a29;
    stim[48] = 32'hf39479ad;
    stim[49] = 32'hfd29fea6;
    stim[50] = 32'h1a5933bd;
    stim[51] = 32'h40718a8f;
    stim[52] = 32'h5c6046cf;
    stim[53] = 32'h5c1c2f91;
    stim[54] = 32'hbd794cf8;
    stim[55] = 32'hf4e4aece;
    stim[56] = 32'h9ce83cfc;
    stim[57] = 32'h3c9d5068;
    stim[58] = 32'h7548ff1f;
    stim[59] = 32'hf03e8cdf;
    stim[60] = 32'h3637f9cc;
    stim[61] = 32'he011fe32;
    stim[62] = 32'h77ba57a4;
    stim[63] = 32'hfb862f3d;
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
      expv[0] = 41'h075d6dc7af4;
      expv[1] = 41'h17c15c05e65;
      expv[2] = 41'h16f2f73f8fc;
      expv[3] = 41'h1b732722f16;
      expv[4] = 41'h1d5c85cb35e;
      expv[5] = 41'h02d02d00c16;
      expv[6] = 41'h1fb923913fc;
      expv[7] = 41'h1b82b03837e;
      expv[8] = 41'h1d201a17456;
      expv[9] = 41'h17712700e3e;
      expv[10] = 41'h1288f08c9f4;
      expv[11] = 41'h0595e95099e;
      expv[12] = 41'h0d6a0ea9c5e;
      expv[13] = 41'h0fc84c83956;
      expv[14] = 41'h1ce0ae1f436;
      expv[15] = 41'h0d4b54a8a06;
      expv[16] = 41'h10a9428317e;
      expv[17] = 41'h0445144971e;
      expv[18] = 41'h0901100fa06;
      expv[19] = 41'h16813801c96;
      expv[20] = 41'h14a7026dbf4;
      expv[21] = 41'h1211991d2f4;
      expv[22] = 41'h15760771674;
      expv[23] = 41'h1254ad58716;
      expv[24] = 41'h082a22aa576;
      expv[25] = 41'h168eb8feafc;
      expv[26] = 41'h1d2c4ad42fc;
      expv[27] = 41'h08a37a31696;
      expv[28] = 41'h0b90510de4a;
      expv[29] = 41'h134b8cbc3f4;
      expv[30] = 41'h0b9b81bd83e;
      expv[31] = 41'h00a2ba38ffc;
      expv[32] = 41'h1e98c99158e;
      expv[33] = 41'h0a37bb7633e;
      expv[34] = 41'h198b40b606d;
      expv[35] = 41'h022c2addc96;
      expv[36] = 41'h1d0bc0b5136;
      expv[37] = 41'h05083884b65;
      expv[38] = 41'h1087f0734f4;
      expv[39] = 41'h02e1661ac2e;
      expv[40] = 41'h0fbdbbdbcf4;
      expv[41] = 41'h19b0eb12156;
      expv[42] = 41'h1d18099caf4;
      expv[43] = 41'h09d375324fc;
      expv[44] = 41'h0f25a24ee0e;
      expv[45] = 41'h07ecf6cce8e;
      expv[46] = 41'h05c3c431ffc;
      expv[47] = 41'h075b15a29f4;
      expv[48] = 41'h1cf9979ad8e;
      expv[49] = 41'h1f7f2fea63e;
      expv[50] = 41'h06b25b3bd26;
      expv[51] = 41'h100a70a8f36;
      expv[52] = 41'h1746646cf06;
      expv[53] = 41'h172e1af9186;
      expv[54] = 41'h0f4d7ccf82e;
      expv[55] = 41'h1d2ee2ece9e;
      expv[56] = 41'h073cebcfc0e;
      expv[57] = 41'h0f509d068f4;
      expv[58] = 41'h1d7f4ff1f16;
      expv[59] = 41'h1c0c38cdffc;
      expv[60] = 41'h0df8379ccf4;
      expv[61] = 41'h187e17e323e;
      expv[62] = 41'h1dd7bd7a442;
      expv[63] = 41'h1eaf82f3dfc;
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
