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

  mg_04072 dut (
    .In1(in_vec[31:0]),
    .Out1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h114789cb;
    stim[1] = 32'h68230f6e;
    stim[2] = 32'h2b2ea731;
    stim[3] = 32'h4ef93b3c;
    stim[4] = 32'h8187543e;
    stim[5] = 32'h04df1236;
    stim[6] = 32'hdb684c55;
    stim[7] = 32'hd23a55b9;
    stim[8] = 32'h0b9e7038;
    stim[9] = 32'h1c5717a9;
    stim[10] = 32'hc0456782;
    stim[11] = 32'h93895bc1;
    stim[12] = 32'h7857373b;
    stim[13] = 32'h64e54c5e;
    stim[14] = 32'hd7055449;
    stim[15] = 32'h3d515f3b;
    stim[16] = 32'h8a0e5aa2;
    stim[17] = 32'h20b13d06;
    stim[18] = 32'h9d41e1aa;
    stim[19] = 32'h109d5de2;
    stim[20] = 32'hd3000e37;
    stim[21] = 32'h707b9b52;
    stim[22] = 32'hcf292308;
    stim[23] = 32'ha8574711;
    stim[24] = 32'h5ae9c6fd;
    stim[25] = 32'hd7f4423c;
    stim[26] = 32'h9330ee4f;
    stim[27] = 32'h33bedcfb;
    stim[28] = 32'heb265c4f;
    stim[29] = 32'h4b40ca58;
    stim[30] = 32'haca039f5;
    stim[31] = 32'hfd621ff1;
    stim[32] = 32'h55ce74bc;
    stim[33] = 32'hf5496674;
    stim[34] = 32'hc8e6458c;
    stim[35] = 32'hc7016a8a;
    stim[36] = 32'he0590d78;
    stim[37] = 32'h67ab37e2;
    stim[38] = 32'h5d65e41c;
    stim[39] = 32'h56f1042b;
    stim[40] = 32'h0004e44c;
    stim[41] = 32'had97ea95;
    stim[42] = 32'hd741db18;
    stim[43] = 32'h3bb30548;
    stim[44] = 32'h54dc8ce2;
    stim[45] = 32'h88a35ff3;
    stim[46] = 32'hd713eb68;
    stim[47] = 32'h1ed520c7;
    stim[48] = 32'h46af8234;
    stim[49] = 32'h11af486d;
    stim[50] = 32'h838135ad;
    stim[51] = 32'h887966ca;
    stim[52] = 32'h6f4c2438;
    stim[53] = 32'h18221819;
    stim[54] = 32'h4909d85c;
    stim[55] = 32'ha880ea42;
    stim[56] = 32'h0caa991e;
    stim[57] = 32'h387d604c;
    stim[58] = 32'h40776693;
    stim[59] = 32'h0aa9d7ad;
    stim[60] = 32'h0a8a77a9;
    stim[61] = 32'h67d61940;
    stim[62] = 32'hd502e87e;
    stim[63] = 32'hf852da04;
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
      expv[0] = 32'h08a3c4e5;
      expv[1] = 32'h341187b7;
      expv[2] = 32'h15975398;
      expv[3] = 32'h277c9d9e;
      expv[4] = 32'hc0c3aa1f;
      expv[5] = 32'h026f891b;
      expv[6] = 32'hedb4262a;
      expv[7] = 32'he91d2adc;
      expv[8] = 32'h05cf381c;
      expv[9] = 32'h0e2b8bd4;
      expv[10] = 32'he022b3c1;
      expv[11] = 32'hc9c4ade0;
      expv[12] = 32'h3c2b9b9d;
      expv[13] = 32'h3272a62f;
      expv[14] = 32'heb82aa24;
      expv[15] = 32'h1ea8af9d;
      expv[16] = 32'hc5072d51;
      expv[17] = 32'h10589e83;
      expv[18] = 32'hcea0f0d5;
      expv[19] = 32'h084eaef1;
      expv[20] = 32'he980071b;
      expv[21] = 32'h383dcda9;
      expv[22] = 32'he7949184;
      expv[23] = 32'hd42ba388;
      expv[24] = 32'h2d74e37e;
      expv[25] = 32'hebfa211e;
      expv[26] = 32'hc9987727;
      expv[27] = 32'h19df6e7d;
      expv[28] = 32'hf5932e27;
      expv[29] = 32'h25a0652c;
      expv[30] = 32'hd6501cfa;
      expv[31] = 32'hfeb10ff8;
      expv[32] = 32'h2ae73a5e;
      expv[33] = 32'hfaa4b33a;
      expv[34] = 32'he47322c6;
      expv[35] = 32'he380b545;
      expv[36] = 32'hf02c86bc;
      expv[37] = 32'h33d59bf1;
      expv[38] = 32'h2eb2f20e;
      expv[39] = 32'h2b788215;
      expv[40] = 32'h00027226;
      expv[41] = 32'hd6cbf54a;
      expv[42] = 32'heba0ed8c;
      expv[43] = 32'h1dd982a4;
      expv[44] = 32'h2a6e4671;
      expv[45] = 32'hc451aff9;
      expv[46] = 32'heb89f5b4;
      expv[47] = 32'h0f6a9063;
      expv[48] = 32'h2357c11a;
      expv[49] = 32'h08d7a436;
      expv[50] = 32'hc1c09ad6;
      expv[51] = 32'hc43cb365;
      expv[52] = 32'h37a6121c;
      expv[53] = 32'h0c110c0c;
      expv[54] = 32'h2484ec2e;
      expv[55] = 32'hd4407521;
      expv[56] = 32'h06554c8f;
      expv[57] = 32'h1c3eb026;
      expv[58] = 32'h203bb349;
      expv[59] = 32'h0554ebd6;
      expv[60] = 32'h05453bd4;
      expv[61] = 32'h33eb0ca0;
      expv[62] = 32'hea81743f;
      expv[63] = 32'hfc296d02;
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
