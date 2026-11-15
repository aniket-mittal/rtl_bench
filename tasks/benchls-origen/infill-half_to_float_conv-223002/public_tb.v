// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_223002 dut (
    .control(in_vec[34:20]),
    .in(in_vec[19:4]),
    .roundingMode(in_vec[3:1]),
    .reset(in_vec[0:0]),
    .out(out_vec[34:3]),
    .exceptionFlags(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h26db78e7b;
    stim[1] = 35'h4a86f6fc9;
    stim[2] = 35'h3569d0d82;
    stim[3] = 35'h75834de3c;
    stim[4] = 35'h7de0087fc;
    stim[5] = 35'h734467e5a;
    stim[6] = 35'h729f8aa06;
    stim[7] = 35'h5a48cfb22;
    stim[8] = 35'h6c76d1490;
    stim[9] = 35'h669d60860;
    stim[10] = 35'h107904c9c;
    stim[11] = 35'h4e8e1579c;
    stim[12] = 35'h391dc004a;
    stim[13] = 35'h3542ca8fa;
    stim[14] = 35'h21cb98268;
    stim[15] = 35'h63dcfbf56;
    stim[16] = 35'h52e3077f8;
    stim[17] = 35'h75c20643e;
    stim[18] = 35'h047c24a83;
    stim[19] = 35'h561aad8eb;
    stim[20] = 35'h099ac4e80;
    stim[21] = 35'h102a6683e;
    stim[22] = 35'h2bd1cc1a7;
    stim[23] = 35'h3581152c8;
    stim[24] = 35'h523341854;
    stim[25] = 35'h53516749a;
    stim[26] = 35'h70412bffa;
    stim[27] = 35'h35ce08a9a;
    stim[28] = 35'h00b592432;
    stim[29] = 35'h07652b344;
    stim[30] = 35'h48c0df782;
    stim[31] = 35'h4910aba82;
    stim[32] = 35'h32226d5aa;
    stim[33] = 35'h7d7e54880;
    stim[34] = 35'h7d86db404;
    stim[35] = 35'h11c560fae;
    stim[36] = 35'h4d0501fe6;
    stim[37] = 35'h50c7284a6;
    stim[38] = 35'h76c6497c8;
    stim[39] = 35'h2e69f4ccc;
    stim[40] = 35'h518c9bc54;
    stim[41] = 35'h051679dce;
    stim[42] = 35'h68c8b69f8;
    stim[43] = 35'h1c86ec8c6;
    stim[44] = 35'h68108ceb6;
    stim[45] = 35'h5771a6e98;
    stim[46] = 35'h673c92873;
    stim[47] = 35'h58b0d3342;
    stim[48] = 35'h55c34c77e;
    stim[49] = 35'h316910810;
    stim[50] = 35'h35a7cd980;
    stim[51] = 35'h24598760c;
    stim[52] = 35'h56c1ded48;
    stim[53] = 35'h73adbf97c;
    stim[54] = 35'h53bb8dff0;
    stim[55] = 35'h23ecb1c3e;
    stim[56] = 35'h5bcfba2f6;
    stim[57] = 35'h3c7c55fb6;
    stim[58] = 35'h1cc50fde0;
    stim[59] = 35'h2f34b8adc;
    stim[60] = 35'h49f130dd0;
    stim[61] = 35'h22c59082b;
    stim[62] = 35'h3299825b4;
    stim[63] = 35'h1ac1bc17a;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h400000002;
      expv[3] = 35'h3fffffffe;
      expv[4] = 35'h3fffffffe;
      expv[5] = 35'h3fffffffe;
      expv[6] = 35'h400000006;
      expv[7] = 35'h400000006;
      expv[8] = 35'h400000006;
      expv[9] = 35'h3fffffffe;
      expv[10] = 35'h3fffffffe;
      expv[11] = 35'h3fffffffe;
      expv[12] = 35'h400000006;
      expv[13] = 35'h400000006;
      expv[14] = 35'h400000006;
      expv[15] = 35'h400000006;
      expv[16] = 35'h3fffffffe;
      expv[17] = 35'h3fffffffe;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h400000002;
      expv[21] = 35'h3fffffffe;
      expv[22] = 35'h000000000;
      expv[23] = 35'h3fffffffe;
      expv[24] = 35'h3fffffffe;
      expv[25] = 35'h3fffffffe;
      expv[26] = 35'h3fffffffe;
      expv[27] = 35'h3fffffffe;
      expv[28] = 35'h400000006;
      expv[29] = 35'h3fffffffe;
      expv[30] = 35'h400000006;
      expv[31] = 35'h400000006;
      expv[32] = 35'h3fffffffe;
      expv[33] = 35'h3fffffffe;
      expv[34] = 35'h400000006;
      expv[35] = 35'h3fffffffe;
      expv[36] = 35'h3fffffffe;
      expv[37] = 35'h3fffffffe;
      expv[38] = 35'h3fffffffe;
      expv[39] = 35'h400000006;
      expv[40] = 35'h400000006;
      expv[41] = 35'h3fffffffe;
      expv[42] = 35'h400000006;
      expv[43] = 35'h400000006;
      expv[44] = 35'h400000006;
      expv[45] = 35'h400000006;
      expv[46] = 35'h000000000;
      expv[47] = 35'h400000002;
      expv[48] = 35'h3fffffffe;
      expv[49] = 35'h3fffffffe;
      expv[50] = 35'h400000006;
      expv[51] = 35'h400000006;
      expv[52] = 35'h400000006;
      expv[53] = 35'h400000006;
      expv[54] = 35'h400000006;
      expv[55] = 35'h400000006;
      expv[56] = 35'h400000006;
      expv[57] = 35'h3fffffffe;
      expv[58] = 35'h3fffffffe;
      expv[59] = 35'h400000006;
      expv[60] = 35'h3fffffffe;
      expv[61] = 35'h000000000;
      expv[62] = 35'h400000002;
      expv[63] = 35'h400000006;
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
