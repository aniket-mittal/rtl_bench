// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01201 dut (
    .PTX(in_vec[71:60]),
    .PTY(in_vec[59:48]),
    .P1X(in_vec[47:36]),
    .P1Y(in_vec[35:24]),
    .P2X(in_vec[23:12]),
    .P2Y(in_vec[11:0]),
    .sin(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hacdb5bab0136e74f3f;
    stim[1] = 72'h98a90144d52fa0ed27;
    stim[2] = 72'h83adfad77c9bba548e;
    stim[3] = 72'h2613eb66893b7da3d4;
    stim[4] = 72'h8cff2032fd9d789c79;
    stim[5] = 72'hc1aab19b8b56524706;
    stim[6] = 72'h964cf013c502bf16ba;
    stim[7] = 72'h85f4adcfda6a2489f7;
    stim[8] = 72'hcc93c32c15b1139324;
    stim[9] = 72'h31100aef0984c6d0c3;
    stim[10] = 72'h83814f484578afb978;
    stim[11] = 72'h0f8a7dda53478283ee;
    stim[12] = 72'h15a6c999ad4c1c5115;
    stim[13] = 72'h6d46c003e88281538c;
    stim[14] = 72'hbbc28203ef0e77f9d6;
    stim[15] = 72'h5b4066eda60a97a5e2;
    stim[16] = 72'h41dee9fb5a615e21bd;
    stim[17] = 72'he55892c42b7a2cd2b3;
    stim[18] = 72'hc525b10691cb957030;
    stim[19] = 72'h88f8be4ca187729d14;
    stim[20] = 72'h783524b43161ebf390;
    stim[21] = 72'hde53198966d327cbf4;
    stim[22] = 72'h929e54e00c70f05d82;
    stim[23] = 72'haf4a0a8f62cd2a0c27;
    stim[24] = 72'h44545528d4166cc02d;
    stim[25] = 72'hcd66931bf1cd29d76b;
    stim[26] = 72'h869fe6152428b47248;
    stim[27] = 72'h9e19675e27fe26cd76;
    stim[28] = 72'h02cc62aecbdffb8af7;
    stim[29] = 72'ha136f25ab2d7494dd9;
    stim[30] = 72'h09639c24203feb864a;
    stim[31] = 72'h972cdf1cd98a6983a1;
    stim[32] = 72'h252b75a8643b2e542e;
    stim[33] = 72'h6e1790dfa63d35b931;
    stim[34] = 72'he62a74692e5c1b2632;
    stim[35] = 72'h1357b7a9963c0c4dd0;
    stim[36] = 72'ha0851b2174c738a6bb;
    stim[37] = 72'h8fc1319ed83d7474cc;
    stim[38] = 72'haab42252f260059f02;
    stim[39] = 72'h3fb186082fe4b10abc;
    stim[40] = 72'h71ba2363bf0c17e221;
    stim[41] = 72'ha7ebdf7b1114999ec3;
    stim[42] = 72'hfe2b7e302450cd151b;
    stim[43] = 72'h82c1b4821014390d82;
    stim[44] = 72'h03c6a32fd72e984cea;
    stim[45] = 72'hd1bbde9db06c27e0fb;
    stim[46] = 72'he83763f9e09bff4366;
    stim[47] = 72'h66d2e8303b273ab17a;
    stim[48] = 72'ha4b3224fa9b614225f;
    stim[49] = 72'h59a2d39e993709d3bb;
    stim[50] = 72'hd1e4dd31f1379916e9;
    stim[51] = 72'h7da6b883dca492102d;
    stim[52] = 72'h89fc216963b246c6cc;
    stim[53] = 72'h5f9f3269711d21d58f;
    stim[54] = 72'ha4f6e4beadb23619f3;
    stim[55] = 72'hd507247c01f6734af3;
    stim[56] = 72'h2448bf3b3ec2cf4a86;
    stim[57] = 72'ha500eff2024b57a7fa;
    stim[58] = 72'h7ead3e58cc52803fbc;
    stim[59] = 72'h46f86d9752ddc53b4e;
    stim[60] = 72'hca4dc589e1398e32d0;
    stim[61] = 72'h8395874ec8353763f6;
    stim[62] = 72'hd292bbff80841ec16a;
    stim[63] = 72'he80e25c782c067a905;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
