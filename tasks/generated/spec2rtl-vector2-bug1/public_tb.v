// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hc107f842;
    stim[1] = 32'hd9aae124;
    stim[2] = 32'h67ec7e15;
    stim[3] = 32'hef3de9d4;
    stim[4] = 32'h8fded26f;
    stim[5] = 32'hfbe69d8f;
    stim[6] = 32'hfdbbce84;
    stim[7] = 32'he2a77aa6;
    stim[8] = 32'h3b62715d;
    stim[9] = 32'h38dcc144;
    stim[10] = 32'h94894736;
    stim[11] = 32'h6d57cf69;
    stim[12] = 32'hfdd877c9;
    stim[13] = 32'hfa0bc9ac;
    stim[14] = 32'h041d3f89;
    stim[15] = 32'hde0bd121;
    stim[16] = 32'h7f723024;
    stim[17] = 32'hdc913d24;
    stim[18] = 32'hdcc5011b;
    stim[19] = 32'h815ac14b;
    stim[20] = 32'h5e60d379;
    stim[21] = 32'h8637c6fc;
    stim[22] = 32'h51560bb3;
    stim[23] = 32'h658b1475;
    stim[24] = 32'h00daeb73;
    stim[25] = 32'hfaa25ed8;
    stim[26] = 32'h80d0b3b8;
    stim[27] = 32'hf07b30d5;
    stim[28] = 32'haad3c16b;
    stim[29] = 32'heb9a857a;
    stim[30] = 32'hf626ec1b;
    stim[31] = 32'h5620f644;
    stim[32] = 32'h4c4a992f;
    stim[33] = 32'hf097d4ed;
    stim[34] = 32'h5c858fda;
    stim[35] = 32'h04ad7dbc;
    stim[36] = 32'h80de9ced;
    stim[37] = 32'h0278a41d;
    stim[38] = 32'h13d432ab;
    stim[39] = 32'h42556699;
    stim[40] = 32'hc0a1bdd0;
    stim[41] = 32'hbe79b433;
    stim[42] = 32'h361e4100;
    stim[43] = 32'hd4473315;
    stim[44] = 32'h7b46a31c;
    stim[45] = 32'h2e00c0d5;
    stim[46] = 32'h2a97a97f;
    stim[47] = 32'h791701c6;
    stim[48] = 32'h4c8001d0;
    stim[49] = 32'hc4057229;
    stim[50] = 32'h8993a096;
    stim[51] = 32'h18fd4f14;
    stim[52] = 32'he219708a;
    stim[53] = 32'h87e1b978;
    stim[54] = 32'he2d2ca01;
    stim[55] = 32'h5c593d27;
    stim[56] = 32'h97036eeb;
    stim[57] = 32'hc15d9eb9;
    stim[58] = 32'h996c22c8;
    stim[59] = 32'hde6e79dd;
    stim[60] = 32'h7756b428;
    stim[61] = 32'hf23fcb57;
    stim[62] = 32'h61dd69ae;
    stim[63] = 32'hf16e8c11;
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
      expv[0] = 32'h217c07c1;
      expv[1] = 32'h1270aad9;
      expv[2] = 32'h0abf6c67;
      expv[3] = 32'h6a74bdef;
      expv[4] = 32'h37e95e8f;
      expv[5] = 32'h47cee6fb;
      expv[6] = 32'h42673bfd;
      expv[7] = 32'h533d27e2;
      expv[8] = 32'h2eb8e23b;
      expv[9] = 32'h2260dc38;
      expv[10] = 32'h1b238994;
      expv[11] = 32'h34e7d76d;
      expv[12] = 32'h64bbd8fd;
      expv[13] = 32'h56648bfa;
      expv[14] = 32'h449f9d04;
      expv[15] = 32'h10e88bde;
      expv[16] = 32'h1218727f;
      expv[17] = 32'h121e91dc;
      expv[18] = 32'h0d80c5dc;
      expv[19] = 32'h25e0da81;
      expv[20] = 32'h3ce9e05e;
      expv[21] = 32'h7e633786;
      expv[22] = 32'h5985d651;
      expv[23] = 32'h3a8a0b65;
      expv[24] = 32'h39f5da00;
      expv[25] = 32'h6c2f22fa;
      expv[26] = 32'h5c59d080;
      expv[27] = 32'h6a987bf0;
      expv[28] = 32'h35e0d3aa;
      expv[29] = 32'h3d429aeb;
      expv[30] = 32'h0df626f6;
      expv[31] = 32'h227b2056;
      expv[32] = 32'h17ccca4c;
      expv[33] = 32'h76ea17f0;
      expv[34] = 32'h6d47855c;
      expv[35] = 32'h5e3ead04;
      expv[36] = 32'h76ce5e80;
      expv[37] = 32'h0ed27802;
      expv[38] = 32'h55995413;
      expv[39] = 32'h4cb35542;
      expv[40] = 32'h685ea1c0;
      expv[41] = 32'h19da79be;
      expv[42] = 32'h00209e36;
      expv[43] = 32'h0a99c7d4;
      expv[44] = 32'h0e51c67b;
      expv[45] = 32'h6ae0002e;
      expv[46] = 32'h3fd4972a;
      expv[47] = 32'h63009779;
      expv[48] = 32'h6800804c;
      expv[49] = 32'h14b905c4;
      expv[50] = 32'h4b501389;
      expv[51] = 32'h0a27fd18;
      expv[52] = 32'h453819e2;
      expv[53] = 32'h3c5ce187;
      expv[54] = 32'h00e552e2;
      expv[55] = 32'h139ed95c;
      expv[56] = 32'h75b70397;
      expv[57] = 32'h5ccf5dc1;
      expv[58] = 32'h64116c99;
      expv[59] = 32'h6ebceede;
      expv[60] = 32'h145a5677;
      expv[61] = 32'h2be5bff2;
      expv[62] = 32'h5734dd61;
      expv[63] = 32'h08c66ef1;
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
