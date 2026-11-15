// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_212200 dut (
    .A(in_vec[74:43]),
    .B(in_vec[42:11]),
    .opcode(in_vec[10:4]),
    .func3(in_vec[3:1]),
    .func7(in_vec[0:0]),
    .B_cond(out_vec[32:32]),
    .alu_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h7fafa13adeb84ba72f2;
    stim[1] = 75'h084540aa07bd1d8835f;
    stim[2] = 75'h6a337e4143f883bd62e;
    stim[3] = 75'h6e04f03d762ab9bc2f8;
    stim[4] = 75'h5953bf26fbfcaaa28ec;
    stim[5] = 75'h6f2268b8b73df23b7f8;
    stim[6] = 75'h1f4708ece015b775456;
    stim[7] = 75'h2ab3fad55fd397a7a1e;
    stim[8] = 75'h573d626819aaccb883d;
    stim[9] = 75'h5c60b95c1bcb1186257;
    stim[10] = 75'h5d2e98debb93afe116a;
    stim[11] = 75'h5d9fb9860008a85e53e;
    stim[12] = 75'h640b46b15a4e7d2644c;
    stim[13] = 75'h66626e3149173a4f8ef;
    stim[14] = 75'h3837da47958ba7d4c93;
    stim[15] = 75'h09437e7b1b80616b7b4;
    stim[16] = 75'h5b996311761e047b32a;
    stim[17] = 75'h1e796c5221f4a5dec7f;
    stim[18] = 75'h4f1d9a9bd598400955b;
    stim[19] = 75'h6d32d53e04a80be385f;
    stim[20] = 75'h564a4c8966886668bea;
    stim[21] = 75'h3cfbb3cc251f39ee5cd;
    stim[22] = 75'h0418b22c7c080575667;
    stim[23] = 75'h0fa2114c40d12d246fd;
    stim[24] = 75'h0e3848cd92ae3b0418e;
    stim[25] = 75'h7b59b26cb54a75d0205;
    stim[26] = 75'h750d6e074d0e127e38f;
    stim[27] = 75'h3dfb2d0cd0b312529c6;
    stim[28] = 75'h69782f7cae3b0d0ea43;
    stim[29] = 75'h626bc7bdf09663ec26d;
    stim[30] = 75'h301434a5023a7649721;
    stim[31] = 75'h724bd5cc7d22b5d7658;
    stim[32] = 75'h0f75d866b24de43fd2b;
    stim[33] = 75'h154a649792ea3df3ba9;
    stim[34] = 75'h0f129f77bd98cc2ae86;
    stim[35] = 75'h42f6d304241f59f661a;
    stim[36] = 75'h1a78330fbe36c0e45e1;
    stim[37] = 75'h47c8b1deb77946b600a;
    stim[38] = 75'h13308a9770f84d3ef06;
    stim[39] = 75'h65254177c252d050433;
    stim[40] = 75'h6d1a53fa1a938aacfa0;
    stim[41] = 75'h30b0281042a8e9e8752;
    stim[42] = 75'h3692bd636d9e7955b74;
    stim[43] = 75'h5391a65efc3d44dd439;
    stim[44] = 75'h69180a6dbd02857a563;
    stim[45] = 75'h51a56f3150a606c433c;
    stim[46] = 75'h2b803a6413ea35b908b;
    stim[47] = 75'h4d60a0303e769df5ff4;
    stim[48] = 75'h2b6e23963083a6c7c87;
    stim[49] = 75'h101a908297897926d3b;
    stim[50] = 75'h15c92a8826745a485f8;
    stim[51] = 75'h71ff50d19b22e4b683b;
    stim[52] = 75'h7312f0174a9fed6ecbe;
    stim[53] = 75'h29d1f90e4e94caeeb29;
    stim[54] = 75'h486fb7a50b2249f2dce;
    stim[55] = 75'h5ef80e870713b3547c5;
    stim[56] = 75'h0cd8971a4461ec742f7;
    stim[57] = 75'h08f965ac4156882bdbc;
    stim[58] = 75'h43570c05d101a5f169e;
    stim[59] = 75'h4474e14b0f7e6b0fb10;
    stim[60] = 75'h4d759360ed4ef34c099;
    stim[61] = 75'h0f7ab926a4412ecc3d2;
    stim[62] = 75'h4abaf26cf398c1f88c0;
    stim[63] = 75'h68865fa89c2d1b6f22e;
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
      expv[0] = 33'hx00000000;
      expv[1] = 33'hx00000000;
      expv[2] = 33'hx00000000;
      expv[3] = 33'hx00000000;
      expv[4] = 33'hx00000000;
      expv[5] = 33'hx00000000;
      expv[6] = 33'hx00000000;
      expv[7] = 33'hx00000000;
      expv[8] = 33'hxe1d05e41;
      expv[9] = 33'hx00000000;
      expv[10] = 33'hx00000000;
      expv[11] = 33'hx00000000;
      expv[12] = 33'hx00000000;
      expv[13] = 33'hx00000000;
      expv[14] = 33'hx00000000;
      expv[15] = 33'hx00000000;
      expv[16] = 33'hx00000000;
      expv[17] = 33'hx00000000;
      expv[18] = 33'hx00000000;
      expv[19] = 33'hx00000000;
      expv[20] = 33'hx00000000;
      expv[21] = 33'hx00000000;
      expv[22] = 33'hx00000000;
      expv[23] = 33'hx1f44229c;
      expv[24] = 33'hx00000000;
      expv[25] = 33'hx00000000;
      expv[26] = 33'hx00000000;
      expv[27] = 33'hx00000000;
      expv[28] = 33'hx00000000;
      expv[29] = 33'hx00000000;
      expv[30] = 33'hx00000000;
      expv[31] = 33'hx00000000;
      expv[32] = 33'hx00000000;
      expv[33] = 33'hx00000000;
      expv[34] = 33'hx00000000;
      expv[35] = 33'hx00000000;
      expv[36] = 33'hx00000000;
      expv[37] = 33'hx00000000;
      expv[38] = 33'hx00000000;
      expv[39] = 33'hx00000000;
      expv[40] = 33'hx00000000;
      expv[41] = 33'hx00000000;
      expv[42] = 33'hxdb3cf000;
      expv[43] = 33'hx00000000;
      expv[44] = 33'hx00000000;
      expv[45] = 33'hxa34edfea;
      expv[46] = 33'hx00000000;
      expv[47] = 33'hx00000000;
      expv[48] = 33'hx00000000;
      expv[49] = 33'hx00000000;
      expv[50] = 33'hx00000000;
      expv[51] = 33'hx1a446b10;
      expv[52] = 33'hx00000000;
      expv[53] = 33'hx00000000;
      expv[54] = 33'hx00000000;
      expv[55] = 33'hx00000000;
      expv[56] = 33'hx00000000;
      expv[57] = 33'hx00000000;
      expv[58] = 33'hx00000000;
      expv[59] = 33'hx00000000;
      expv[60] = 33'hx00000000;
      expv[61] = 33'hx00000000;
      expv[62] = 33'hx00000000;
      expv[63] = 33'hx00000000;
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
