// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079817 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h168595cd;
    stim[1] = 32'hf3ab73e3;
    stim[2] = 32'hc5f773e0;
    stim[3] = 32'h9fdafaa2;
    stim[4] = 32'hd93280c1;
    stim[5] = 32'h45031226;
    stim[6] = 32'h61327787;
    stim[7] = 32'h76844ff2;
    stim[8] = 32'h6ad63170;
    stim[9] = 32'h978019e3;
    stim[10] = 32'h96758d2f;
    stim[11] = 32'hba29a0b9;
    stim[12] = 32'hb8c2345e;
    stim[13] = 32'hdf840e62;
    stim[14] = 32'hfe79938e;
    stim[15] = 32'hae5ff7e8;
    stim[16] = 32'h4055a20a;
    stim[17] = 32'habb3e7f7;
    stim[18] = 32'h95a8daab;
    stim[19] = 32'h43e69d29;
    stim[20] = 32'hec88e8a0;
    stim[21] = 32'h85b59401;
    stim[22] = 32'h4961c54d;
    stim[23] = 32'hb3776631;
    stim[24] = 32'hb6e3a01a;
    stim[25] = 32'hf6a606c2;
    stim[26] = 32'h44290be6;
    stim[27] = 32'h7bd1537b;
    stim[28] = 32'ha0a6c779;
    stim[29] = 32'hb491ad2d;
    stim[30] = 32'h816ea211;
    stim[31] = 32'h421544eb;
    stim[32] = 32'ha270f134;
    stim[33] = 32'hd41305bd;
    stim[34] = 32'hab50fd38;
    stim[35] = 32'hea2a9a8d;
    stim[36] = 32'h275ee511;
    stim[37] = 32'h05b5e4c0;
    stim[38] = 32'h54ae4812;
    stim[39] = 32'hb499b237;
    stim[40] = 32'h2d15516c;
    stim[41] = 32'hb895d8b2;
    stim[42] = 32'h22407fba;
    stim[43] = 32'hbfae8185;
    stim[44] = 32'h59a4cad5;
    stim[45] = 32'h702d29a0;
    stim[46] = 32'h648323a4;
    stim[47] = 32'hd8a381b3;
    stim[48] = 32'h7294bb2f;
    stim[49] = 32'h855e513a;
    stim[50] = 32'he1cd1ca3;
    stim[51] = 32'heb7b8c50;
    stim[52] = 32'hf4f1078d;
    stim[53] = 32'hb11029ed;
    stim[54] = 32'h780e53e7;
    stim[55] = 32'hf8d190b1;
    stim[56] = 32'hd670fae7;
    stim[57] = 32'h21e027e2;
    stim[58] = 32'h8924755a;
    stim[59] = 32'h9245c426;
    stim[60] = 32'h728453b6;
    stim[61] = 32'hdd700ec5;
    stim[62] = 32'h9d59dca4;
    stim[63] = 32'h3568c3c5;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h2;
      expv[6] = 3'h2;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h2;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h2;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h2;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h0;
      expv[46] = 3'h2;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h2;
      expv[55] = 3'h0;
      expv[56] = 3'h2;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h2;
      expv[60] = 3'h2;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
