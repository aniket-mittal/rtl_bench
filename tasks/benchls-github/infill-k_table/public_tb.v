// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  k_table dut (
    .idx(in_vec[6:0]),
    .k(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h69;
    stim[1] = 7'h0a;
    stim[2] = 7'h34;
    stim[3] = 7'h57;
    stim[4] = 7'h04;
    stim[5] = 7'h65;
    stim[6] = 7'h7d;
    stim[7] = 7'h0b;
    stim[8] = 7'h2a;
    stim[9] = 7'h21;
    stim[10] = 7'h33;
    stim[11] = 7'h70;
    stim[12] = 7'h0a;
    stim[13] = 7'h4e;
    stim[14] = 7'h4f;
    stim[15] = 7'h3f;
    stim[16] = 7'h1c;
    stim[17] = 7'h7d;
    stim[18] = 7'h00;
    stim[19] = 7'h38;
    stim[20] = 7'h3c;
    stim[21] = 7'h3e;
    stim[22] = 7'h7f;
    stim[23] = 7'h2f;
    stim[24] = 7'h09;
    stim[25] = 7'h17;
    stim[26] = 7'h57;
    stim[27] = 7'h0d;
    stim[28] = 7'h56;
    stim[29] = 7'h5b;
    stim[30] = 7'h2c;
    stim[31] = 7'h7f;
    stim[32] = 7'h27;
    stim[33] = 7'h73;
    stim[34] = 7'h1f;
    stim[35] = 7'h4a;
    stim[36] = 7'h09;
    stim[37] = 7'h50;
    stim[38] = 7'h05;
    stim[39] = 7'h36;
    stim[40] = 7'h03;
    stim[41] = 7'h35;
    stim[42] = 7'h7c;
    stim[43] = 7'h7c;
    stim[44] = 7'h1d;
    stim[45] = 7'h3c;
    stim[46] = 7'h21;
    stim[47] = 7'h69;
    stim[48] = 7'h58;
    stim[49] = 7'h1f;
    stim[50] = 7'h5a;
    stim[51] = 7'h6e;
    stim[52] = 7'h30;
    stim[53] = 7'h31;
    stim[54] = 7'h52;
    stim[55] = 7'h77;
    stim[56] = 7'h01;
    stim[57] = 7'h38;
    stim[58] = 7'h21;
    stim[59] = 7'h01;
    stim[60] = 7'h77;
    stim[61] = 7'h28;
    stim[62] = 7'h14;
    stim[63] = 7'h31;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h243185be4ee4b28c;
      expv[2] = 64'h391c0cb3c5c95a63;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h3956c25bf348b538;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h550c7dc3d5ffb4e2;
      expv[8] = 64'hc24b8b70d0f89791;
      expv[9] = 64'h2e1b21385c26c926;
      expv[10] = 64'h34b0bcb5e19b48a8;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h243185be4ee4b28c;
      expv[13] = 64'h5fcb6fab3ad6faec;
      expv[14] = 64'h6c44198c4a475817;
      expv[15] = 64'hc67178f2e372532b;
      expv[16] = 64'hc6e00bf33da88fc2;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h428a2f98d728ae22;
      expv[19] = 64'h748f82ee5defb2fc;
      expv[20] = 64'h90befffa23631e28;
      expv[21] = 64'hbef9a3f7b2c67915;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h106aa07032bbd1b8;
      expv[24] = 64'h12835b0145706fbe;
      expv[25] = 64'h76f988da831153b5;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h80deb1fe3b1696b1;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'hd192e819d6ef5218;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h92722c851482353b;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h142929670a0e6e70;
      expv[35] = 64'h3c9ebe0a15c9bebc;
      expv[36] = 64'h12835b0145706fbe;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h59f111f1b605d019;
      expv[39] = 64'h5b9cca4f7763e373;
      expv[40] = 64'he9b5dba58189dbbc;
      expv[41] = 64'h4ed8aa4ae3418acb;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'hd5a79147930aa725;
      expv[45] = 64'h90befffa23631e28;
      expv[46] = 64'h2e1b21385c26c926;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h142929670a0e6e70;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h19a4c116b8d2d0c8;
      expv[53] = 64'h1e376c085141ab53;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h7137449123ef65cd;
      expv[57] = 64'h748f82ee5defb2fc;
      expv[58] = 64'h2e1b21385c26c926;
      expv[59] = 64'h7137449123ef65cd;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'ha2bfe8a14cf10364;
      expv[62] = 64'h2de92c6f592b0275;
      expv[63] = 64'h1e376c085141ab53;
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
