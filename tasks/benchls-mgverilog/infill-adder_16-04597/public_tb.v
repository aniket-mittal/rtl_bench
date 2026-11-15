// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04597 dut (
    .in1(in_vec[31:16]),
    .in2(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h1e5ffb6e;
    stim[1] = 32'hf2de8aac;
    stim[2] = 32'h12bac30e;
    stim[3] = 32'h2ab81e22;
    stim[4] = 32'h861a9974;
    stim[5] = 32'hc6845a7f;
    stim[6] = 32'hfedb51cc;
    stim[7] = 32'h486902af;
    stim[8] = 32'h961ff918;
    stim[9] = 32'h71efab7d;
    stim[10] = 32'hde59f944;
    stim[11] = 32'hc5782b81;
    stim[12] = 32'hc39ae629;
    stim[13] = 32'hc5b644ac;
    stim[14] = 32'hb3403a62;
    stim[15] = 32'h9ea9536c;
    stim[16] = 32'h0c5c0834;
    stim[17] = 32'h533b59f0;
    stim[18] = 32'h424184ac;
    stim[19] = 32'hfbcc48e7;
    stim[20] = 32'h2e4e7419;
    stim[21] = 32'h002c2433;
    stim[22] = 32'hbd2abb0a;
    stim[23] = 32'hee665496;
    stim[24] = 32'he86cb7cd;
    stim[25] = 32'h7b619143;
    stim[26] = 32'h843f27bd;
    stim[27] = 32'hb1536222;
    stim[28] = 32'hef030c1b;
    stim[29] = 32'h2f5e5356;
    stim[30] = 32'hd1a2de86;
    stim[31] = 32'hbe055255;
    stim[32] = 32'hbb353a3c;
    stim[33] = 32'hd12b790a;
    stim[34] = 32'hd582aaa0;
    stim[35] = 32'hc169d174;
    stim[36] = 32'hc090d10e;
    stim[37] = 32'hce204b5f;
    stim[38] = 32'h4203703b;
    stim[39] = 32'he6dd9bef;
    stim[40] = 32'h459c697d;
    stim[41] = 32'h583b7c64;
    stim[42] = 32'hb49c5924;
    stim[43] = 32'h42a5ffaa;
    stim[44] = 32'hcc32fbb2;
    stim[45] = 32'hd3278ea9;
    stim[46] = 32'h8397c0d8;
    stim[47] = 32'h2b9cc937;
    stim[48] = 32'h18177ea4;
    stim[49] = 32'h50b43c4c;
    stim[50] = 32'h2b0f3cff;
    stim[51] = 32'h59d5a758;
    stim[52] = 32'h2563b5b7;
    stim[53] = 32'h9884c6d1;
    stim[54] = 32'ha6453905;
    stim[55] = 32'h5d188222;
    stim[56] = 32'hcddad928;
    stim[57] = 32'h9964806b;
    stim[58] = 32'hcbce915d;
    stim[59] = 32'h3a0111f6;
    stim[60] = 32'hdc7afab0;
    stim[61] = 32'ha0b1edcb;
    stim[62] = 32'h3db621ad;
    stim[63] = 32'h4cc7b59c;
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
      expv[0] = 16'h19cd;
      expv[1] = 16'h7d8a;
      expv[2] = 16'hd5c8;
      expv[3] = 16'h48da;
      expv[4] = 16'h1f8e;
      expv[5] = 16'h2103;
      expv[6] = 16'h50a7;
      expv[7] = 16'h4b18;
      expv[8] = 16'h8f37;
      expv[9] = 16'h1d6c;
      expv[10] = 16'hd79d;
      expv[11] = 16'hf0f9;
      expv[12] = 16'ha9c3;
      expv[13] = 16'h0a62;
      expv[14] = 16'heda2;
      expv[15] = 16'hf215;
      expv[16] = 16'h1490;
      expv[17] = 16'had2b;
      expv[18] = 16'hc6ed;
      expv[19] = 16'h44b3;
      expv[20] = 16'ha267;
      expv[21] = 16'h245f;
      expv[22] = 16'h7834;
      expv[23] = 16'h42fc;
      expv[24] = 16'ha039;
      expv[25] = 16'h0ca4;
      expv[26] = 16'habfc;
      expv[27] = 16'h1375;
      expv[28] = 16'hfb1e;
      expv[29] = 16'h82b4;
      expv[30] = 16'hb028;
      expv[31] = 16'h105a;
      expv[32] = 16'hf571;
      expv[33] = 16'h4a35;
      expv[34] = 16'h8022;
      expv[35] = 16'h92dd;
      expv[36] = 16'h919e;
      expv[37] = 16'h197f;
      expv[38] = 16'hb23e;
      expv[39] = 16'h82cc;
      expv[40] = 16'haf19;
      expv[41] = 16'hd49f;
      expv[42] = 16'h0dc0;
      expv[43] = 16'h424f;
      expv[44] = 16'hc7e4;
      expv[45] = 16'h61d0;
      expv[46] = 16'h446f;
      expv[47] = 16'hf4d3;
      expv[48] = 16'h96bb;
      expv[49] = 16'h8d00;
      expv[50] = 16'h680e;
      expv[51] = 16'h012d;
      expv[52] = 16'hdb1a;
      expv[53] = 16'h5f55;
      expv[54] = 16'hdf4a;
      expv[55] = 16'hdf3a;
      expv[56] = 16'ha702;
      expv[57] = 16'h19cf;
      expv[58] = 16'h5d2b;
      expv[59] = 16'h4bf7;
      expv[60] = 16'hd72a;
      expv[61] = 16'h8e7c;
      expv[62] = 16'h5f63;
      expv[63] = 16'h0263;
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
