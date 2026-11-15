// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183246 dut (
    .in1(in_vec[67:36]),
    .in2(in_vec[35:4]),
    .aluControl(in_vec[3:0]),
    .out(out_vec[32:1]),
    .zeroFlag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hbbe746b85a5fa8ba0;
    stim[1] = 68'h3a378d70c9bc8febf;
    stim[2] = 68'hc8ca5a92eeed68415;
    stim[3] = 68'hf99ec2cc66880dd29;
    stim[4] = 68'h880ecca48ab3a3726;
    stim[5] = 68'h5486b44283cac6136;
    stim[6] = 68'he75d4791c63ba36c1;
    stim[7] = 68'hddef6f5dd7077cdbb;
    stim[8] = 68'h66c88d44844e9d19d;
    stim[9] = 68'h7c7e5d24bb47a205f;
    stim[10] = 68'h5178953013a0d2220;
    stim[11] = 68'hf83850e156a2b19d1;
    stim[12] = 68'h90905efc6a8470b12;
    stim[13] = 68'h0657284933157deb1;
    stim[14] = 68'h6a0100138f29bb749;
    stim[15] = 68'h3d429963da49bfd87;
    stim[16] = 68'had26ed31bc20beb2e;
    stim[17] = 68'hd7697b966aca3539e;
    stim[18] = 68'h026e02ab505089807;
    stim[19] = 68'haca3cde8f13eef466;
    stim[20] = 68'hcf4395a6a4a4bebcf;
    stim[21] = 68'h2bd7e98c85691b4d6;
    stim[22] = 68'h4fd6bb7fdadaed70d;
    stim[23] = 68'h4101e2f141b9b7b1a;
    stim[24] = 68'ha4269e9dc7e95b915;
    stim[25] = 68'he2438c6d9d7eb4ab6;
    stim[26] = 68'h056cbee6b5fa21e78;
    stim[27] = 68'h84490d05f23579034;
    stim[28] = 68'h18de76952c1097f47;
    stim[29] = 68'hd327f24140cc1dfe4;
    stim[30] = 68'hb8df6156c550e8324;
    stim[31] = 68'hf62d69d74e38cb5b5;
    stim[32] = 68'h35d7c8f6584f064b0;
    stim[33] = 68'h8995c184b7d6f5243;
    stim[34] = 68'hcd5d3ecd0a51e059b;
    stim[35] = 68'headd03ac8d3a84ca0;
    stim[36] = 68'h940c2bd5b85f2b981;
    stim[37] = 68'h6bfb60dc2a53f5f58;
    stim[38] = 68'h9490fb8049c64fdf3;
    stim[39] = 68'h05ce3a50c7126a7e7;
    stim[40] = 68'hfa843e59771aedfa0;
    stim[41] = 68'h18b0efba51ab1e5b4;
    stim[42] = 68'h9be1f335c5ba14cf6;
    stim[43] = 68'hf1bb9009b73d19257;
    stim[44] = 68'h741b32a60c81476aa;
    stim[45] = 68'h9b4e94ed9011b0567;
    stim[46] = 68'he6ec98db353e624c9;
    stim[47] = 68'he02140c67480cece6;
    stim[48] = 68'h1ad675f3d473e81af;
    stim[49] = 68'hf73217ec9968c112f;
    stim[50] = 68'h9d2e9c485f1dfb0fb;
    stim[51] = 68'h4a75a3d3e591614f1;
    stim[52] = 68'h0c78e0198a8f501f0;
    stim[53] = 68'h100000a86f41ece06;
    stim[54] = 68'h6c3db1c02129b2a38;
    stim[55] = 68'ha49203dc0acee9e2e;
    stim[56] = 68'hb86a2404e34b6a5f8;
    stim[57] = 68'h36e003306c887d678;
    stim[58] = 68'h9be6cce3f022491b3;
    stim[59] = 68'h5a6c54499740f2eb9;
    stim[60] = 68'h9f86a30ed2dd52762;
    stim[61] = 68'h9730a2b7275017a45;
    stim[62] = 68'h34ec1a043085afce5;
    stim[63] = 68'h4ecb0fefcae619f75;
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
      expv[0] = 33'h0348e0170;
      expv[1] = 33'h000000001;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h1ceffcffa;
      expv[7] = 33'h000000003;
      expv[8] = 33'h000000000;
      expv[9] = 33'h11f974900;
      expv[10] = 33'h022412040;
      expv[11] = 33'h1fd75e3fa;
      expv[12] = 33'h1f6299f5a;
      expv[13] = 33'h06eaefbd6;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000003;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000003;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000003;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h0208e0084;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000003;
      expv[35] = 33'h110300110;
      expv[36] = 33'h178be57ba;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000003;
      expv[40] = 33'h0e40058b0;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h198000000;
      expv[49] = 33'h0bf600000;
      expv[50] = 33'h000000003;
      expv[51] = 33'h1dfebc7be;
      expv[52] = 33'h010108032;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h0e4c7eb08;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
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
