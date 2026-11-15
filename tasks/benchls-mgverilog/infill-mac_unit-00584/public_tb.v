// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00584 dut (
    .in0(in_vec[59:52]),
    .in1(in_vec[51:30]),
    .in2(in_vec[29:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h7bf314925974c52;
    stim[1] = 60'h073a8cb47969be7;
    stim[2] = 60'h1474a88f2eeb7d3;
    stim[3] = 60'h03cc73c7b323c26;
    stim[4] = 60'h948813cfede1bfe;
    stim[5] = 60'he0f2078fb5d1b4d;
    stim[6] = 60'h006e449da1b3b7d;
    stim[7] = 60'hece6f924e82077b;
    stim[8] = 60'h0bf151ed4c8af6e;
    stim[9] = 60'h4c00063ca09a7f3;
    stim[10] = 60'h0271210c21d5e1d;
    stim[11] = 60'h1dc6a29a768adfb;
    stim[12] = 60'h70af1d56c0cee4d;
    stim[13] = 60'hd09627f2be757e5;
    stim[14] = 60'h9a2a8b2f1ab9064;
    stim[15] = 60'h4f0afc1236b1625;
    stim[16] = 60'hd0114e73b64d70d;
    stim[17] = 60'h98bcd8edae78ef7;
    stim[18] = 60'h9741ad540e06927;
    stim[19] = 60'h933f4dab1f4016a;
    stim[20] = 60'hd3b81d0c4c264b1;
    stim[21] = 60'ha9b3e9de35e526e;
    stim[22] = 60'h8cc7683033127f5;
    stim[23] = 60'h86d2536dfe13e70;
    stim[24] = 60'h8d83b006c1bf794;
    stim[25] = 60'h142d4a848f5270e;
    stim[26] = 60'h9ea4765de115d62;
    stim[27] = 60'h050204f05a7ef4e;
    stim[28] = 60'hfb959f89c93d8af;
    stim[29] = 60'h2c5a4e2904df3ff;
    stim[30] = 60'h24a16a95156a3c8;
    stim[31] = 60'h1a86b9c0da06f41;
    stim[32] = 60'h32f97f02ffc0664;
    stim[33] = 60'h15047d4e1278fca;
    stim[34] = 60'h968eadd175b1535;
    stim[35] = 60'h5a5aa33e967c01d;
    stim[36] = 60'h9b8d809a7464a1e;
    stim[37] = 60'hbaa618c9ee9770c;
    stim[38] = 60'h774813c4bcfae60;
    stim[39] = 60'hff846d542d0aec4;
    stim[40] = 60'hdd6fd0ef8689279;
    stim[41] = 60'h76e997349ff1030;
    stim[42] = 60'ha4d0f15983399db;
    stim[43] = 60'h816f12c2f4a69ba;
    stim[44] = 60'h48b56224727b9c3;
    stim[45] = 60'hd0c62118c51a66a;
    stim[46] = 60'h562b6703071dfac;
    stim[47] = 60'hfd175f71b077e54;
    stim[48] = 60'hd9460d7c276e0f7;
    stim[49] = 60'hbea975024498a06;
    stim[50] = 60'h52f66a818af05a1;
    stim[51] = 60'h25bce5a1a5318b2;
    stim[52] = 60'h9253b577f20515c;
    stim[53] = 60'hd659ebc9bf6db68;
    stim[54] = 60'hfd5e1bcdce4c009;
    stim[55] = 60'he47bb2c1be0c7bd;
    stim[56] = 60'h64d7c8bab6677ba;
    stim[57] = 60'h6361748e83a7f77;
    stim[58] = 60'had23161f52e903e;
    stim[59] = 60'ha853d06df5fe10e;
    stim[60] = 60'hfbbdc187bbc6494;
    stim[61] = 60'h94d5127f3b3fcf9;
    stim[62] = 60'h3a5f6c93deb74cd;
    stim[63] = 60'h3a4a0ed5477b681;
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
      expv[0] = 32'h240a049e;
      expv[1] = 32'h07fd1222;
      expv[2] = 32'h3536028f;
      expv[3] = 32'h3b0b92f9;
      expv[4] = 32'h4b84057a;
      expv[5] = 32'h3bccdeed;
      expv[6] = 32'h1a1b3b7d;
      expv[7] = 32'h0eff29c7;
      expv[8] = 32'h14a050b7;
      expv[9] = 32'h0a0a1e67;
      expv[10] = 32'h0255eea3;
      expv[11] = 32'h25c8c8c9;
      expv[12] = 32'h2334237d;
      expv[13] = 32'h30dd78a5;
      expv[14] = 32'h2d6eb382;
      expv[15] = 32'h24440861;
      expv[16] = 32'h3a9529cd;
      expv[17] = 32'h21b986ff;
      expv[18] = 32'hfa24634a;
      expv[19] = 32'h2b36fd48;
      expv[20] = 32'h07eb1dea;
      expv[21] = 32'h29d533fd;
      expv[22] = 32'h099a5a85;
      expv[23] = 32'h25524e12;
      expv[24] = 32'h3a11f321;
      expv[25] = 32'h09d79ba2;
      expv[26] = 32'h26d40994;
      expv[27] = 32'h05aa757a;
      expv[28] = 32'h1d18d145;
      expv[29] = 32'h142f4fb7;
      expv[30] = 32'h0e0362fc;
      expv[31] = 32'h0a8c26a1;
      expv[32] = 32'h2faab9e4;
      expv[33] = 32'h213f2199;
      expv[34] = 32'h2316172d;
      expv[35] = 32'h315f18e3;
      expv[36] = 32'h32915b20;
      expv[37] = 32'h250ec560;
      expv[38] = 32'h142ffa67;
      expv[39] = 32'h02ef936f;
      expv[40] = 32'h34962e68;
      expv[41] = 32'h0769fcae;
      expv[42] = 32'h1c6deaf3;
      expv[43] = 32'h2183d66a;
      expv[44] = 32'h01e8a04b;
      expv[45] = 32'h0f08194a;
      expv[46] = 32'h3417062c;
      expv[47] = 32'h1af5f6c0;
      expv[48] = 32'hffcbdd7e;
      expv[49] = 32'h29dd7f86;
      expv[50] = 32'h17ea8ce1;
      expv[51] = 32'h17e664ba;
      expv[52] = 32'h36225366;
      expv[53] = 32'h1846afb4;
      expv[54] = 32'h1c9e2b30;
      expv[55] = 32'h187ee47d;
      expv[56] = 32'h277911b2;
      expv[57] = 32'h31a68400;
      expv[58] = 32'h32568579;
      expv[59] = 32'h182bf7c6;
      expv[60] = 32'h3c0f32af;
      expv[61] = 32'h383b09e5;
      expv[62] = 32'h43531af5;
      expv[63] = 32'h18a98d83;
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
