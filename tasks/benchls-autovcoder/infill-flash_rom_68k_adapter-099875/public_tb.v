// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099875 dut (
    .clk8(clk),
    .addr(in_vec[34:14]),
    ._OE(in_vec[13:13]),
    ._CS(in_vec[12:12]),
    ._UDS(in_vec[11:11]),
    ._LDS(in_vec[10:10]),
    .extraRomRead(in_vec[9:9]),
    .A0(in_vec[8:8]),
    .flashData(in_vec[7:0]),
    .dataOut(out_vec[39:24]),
    .flashAddr(out_vec[23:2]),
    ._flashCE(out_vec[1:1]),
    ._flashOE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3c3bfdf0b;
    stim[1] = 35'h086964f36;
    stim[2] = 35'h2d2faf05a;
    stim[3] = 35'h2f0b0c2a7;
    stim[4] = 35'h52f3c31c8;
    stim[5] = 35'h6388511c9;
    stim[6] = 35'h38ce697b8;
    stim[7] = 35'h1156be118;
    stim[8] = 35'h6817bd79b;
    stim[9] = 35'h7c82b9e1c;
    stim[10] = 35'h453e527d6;
    stim[11] = 35'h33ce1c04e;
    stim[12] = 35'h7e96ce83d;
    stim[13] = 35'h43a2319ad;
    stim[14] = 35'h79f9ce3d3;
    stim[15] = 35'h5b18bdbd0;
    stim[16] = 35'h52759d8af;
    stim[17] = 35'h6671d538e;
    stim[18] = 35'h5bf1331f3;
    stim[19] = 35'h5de3a6763;
    stim[20] = 35'h5d5c39e11;
    stim[21] = 35'h5b3a6c400;
    stim[22] = 35'h43468b371;
    stim[23] = 35'h7883bb506;
    stim[24] = 35'h54fe34ad9;
    stim[25] = 35'h3d3eae4a0;
    stim[26] = 35'h53b3d7800;
    stim[27] = 35'h494b71a6c;
    stim[28] = 35'h34455555e;
    stim[29] = 35'h7a9eace48;
    stim[30] = 35'h4824facc1;
    stim[31] = 35'h693fd6464;
    stim[32] = 35'h3b5cf4f2d;
    stim[33] = 35'h19e084685;
    stim[34] = 35'h17f5fb61e;
    stim[35] = 35'h74dd9c376;
    stim[36] = 35'h3459b6a5d;
    stim[37] = 35'h52fa4002e;
    stim[38] = 35'h76d2511d0;
    stim[39] = 35'h422d71da4;
    stim[40] = 35'h412762d09;
    stim[41] = 35'h4b5d1e8c4;
    stim[42] = 35'h7210cc315;
    stim[43] = 35'h63560f7de;
    stim[44] = 35'h356510166;
    stim[45] = 35'h59c587984;
    stim[46] = 35'h241ed3c60;
    stim[47] = 35'h1bc2559c7;
    stim[48] = 35'h45be370dd;
    stim[49] = 35'h7c3f0f86b;
    stim[50] = 35'h75112ea3b;
    stim[51] = 35'h6e92702f2;
    stim[52] = 35'h596f3b588;
    stim[53] = 35'h3120c4a28;
    stim[54] = 35'h4216a38ce;
    stim[55] = 35'h0ed8b541f;
    stim[56] = 35'h78099eefd;
    stim[57] = 35'h341f5d2cd;
    stim[58] = 35'h223c5a6fd;
    stim[59] = 35'h4b579b569;
    stim[60] = 35'h3a006ac89;
    stim[61] = 35'h043bf05f7;
    stim[62] = 35'h3dc810802;
    stim[63] = 35'h44c403d1a;
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
      expv[0] = 40'hbeef7877fe;
      expv[1] = 40'hbeef10d2cc;
      expv[2] = 40'hxxxx5a5f5x;
      expv[3] = 40'h00a75e1618;
      expv[4] = 40'hxxxxa5e78x;
      expv[5] = 40'hxxcxc710ax;
      expv[6] = 40'h00ef719cd6;
      expv[7] = 40'hxxx822ad7x;
      expv[8] = 40'h00efd02f7e;
      expv[9] = 40'hbeeff90572;
      expv[10] = 40'h00ef8a7ca5;
      expv[11] = 40'hxxxx679c3x;
      expv[12] = 40'hbexxfd2d9x;
      expv[13] = 40'hbexd87446x;
      expv[14] = 40'h00d3f3f39d;
      expv[15] = 40'hbed0b6317e;
      expv[16] = 40'hbexxa4eb3x;
      expv[17] = 40'h008ecce3ae;
      expv[18] = 40'hxxxxb7e26x;
      expv[19] = 40'h00efbbc74d;
      expv[20] = 40'hbeefbab872;
      expv[21] = 40'hxxefb674dx;
      expv[22] = 40'h0071868d17;
      expv[23] = 40'hxxeff1077x;
      expv[24] = 40'hbed9a9fc68;
      expv[25] = 40'hxxef7a7d5x;
      expv[26] = 40'hbex0a767ax;
      expv[27] = 40'hbe6c9296e2;
      expv[28] = 40'hxxef688aax;
      expv[29] = 40'hbeeff53d58;
      expv[30] = 40'hbeef9049fx;
      expv[31] = 40'hxxefd27fax;
      expv[32] = 40'hbeef76b9ec;
      expv[33] = 40'h00ef33c108;
      expv[34] = 40'h00ef2febf3;
      expv[35] = 40'h0076e9bb3c;
      expv[36] = 40'hbe5d68b369;
      expv[37] = 40'hxxxxa5f48x;
      expv[38] = 40'hxxxxeda4ax;
      expv[39] = 40'hbeef845aex;
      expv[40] = 40'hbeef824ecx;
      expv[41] = 40'hbexx96ba3x;
      expv[42] = 40'h0015e4219c;
      expv[43] = 40'h00efc6ac1f;
      expv[44] = 40'hxxxx6aca2x;
      expv[45] = 40'hbexxb38b0x;
      expv[46] = 40'hbeef483dax;
      expv[47] = 40'hbexx3784ax;
      expv[48] = 40'hxxxx8b7c6x;
      expv[49] = 40'hbexxf87e1x;
      expv[50] = 40'hbe3bea2259;
      expv[51] = 40'h00f2dd24e0;
      expv[52] = 40'hxxefb2de7x;
      expv[53] = 40'hbe28624188;
      expv[54] = 40'hbexx842d4x;
      expv[55] = 40'hxxef1db16x;
      expv[56] = 40'hbeeff01339;
      expv[57] = 40'h00cd683eba;
      expv[58] = 40'h00ef4478b1;
      expv[59] = 40'hxxef96af3x;
      expv[60] = 40'hbeef7400dx;
      expv[61] = 40'hxxef0877ex;
      expv[62] = 40'hbexx7b902x;
      expv[63] = 40'hbeef89880x;
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
