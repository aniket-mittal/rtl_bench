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

  origen_123342 dut (
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
    stim[0] = 32'h9247abee;
    stim[1] = 32'h8a26cfef;
    stim[2] = 32'h56a3255f;
    stim[3] = 32'h9983b478;
    stim[4] = 32'hb6917b1e;
    stim[5] = 32'h92bbb49d;
    stim[6] = 32'h0f252ccc;
    stim[7] = 32'h074f305a;
    stim[8] = 32'h2227f5a3;
    stim[9] = 32'h0fb44e34;
    stim[10] = 32'hef8eccc3;
    stim[11] = 32'h224d9d5f;
    stim[12] = 32'h6f2ffa73;
    stim[13] = 32'hbd6ea5a3;
    stim[14] = 32'h2ea2b555;
    stim[15] = 32'h1a8963a7;
    stim[16] = 32'h4b280290;
    stim[17] = 32'h7948e520;
    stim[18] = 32'h06e63bc8;
    stim[19] = 32'h27e4460b;
    stim[20] = 32'hf916eb75;
    stim[21] = 32'hf6636a78;
    stim[22] = 32'hfb0e53a6;
    stim[23] = 32'h240c8fd2;
    stim[24] = 32'h0f6c0c62;
    stim[25] = 32'h9f9bfbc5;
    stim[26] = 32'h2b699a99;
    stim[27] = 32'h432c50d1;
    stim[28] = 32'hf901905e;
    stim[29] = 32'h9c88da68;
    stim[30] = 32'hef8a1d49;
    stim[31] = 32'h792efb42;
    stim[32] = 32'h175d6664;
    stim[33] = 32'h69cc2649;
    stim[34] = 32'h6c1868ab;
    stim[35] = 32'h6ac24cac;
    stim[36] = 32'hc1e6b0af;
    stim[37] = 32'h4d8c944c;
    stim[38] = 32'hd6a77cc5;
    stim[39] = 32'h5184c8a5;
    stim[40] = 32'h9ba53d80;
    stim[41] = 32'h33e7296a;
    stim[42] = 32'h67db2bc5;
    stim[43] = 32'hd763cf02;
    stim[44] = 32'h42715279;
    stim[45] = 32'h8618e053;
    stim[46] = 32'hc10fef09;
    stim[47] = 32'hc8b0840a;
    stim[48] = 32'ha4508419;
    stim[49] = 32'h0f2b9806;
    stim[50] = 32'h415d0514;
    stim[51] = 32'h26c4c790;
    stim[52] = 32'h7df629c2;
    stim[53] = 32'h72c7af3e;
    stim[54] = 32'h65f3eaa7;
    stim[55] = 32'h8a5e253f;
    stim[56] = 32'h8e680249;
    stim[57] = 32'h6c5c5878;
    stim[58] = 32'hd01137f2;
    stim[59] = 32'hdcb77b05;
    stim[60] = 32'h03b1eb1c;
    stim[61] = 32'h15006737;
    stim[62] = 32'he4caf35e;
    stim[63] = 32'he18c95ba;
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
      expv[0] = 32'hab9247ee;
      expv[1] = 32'hcf8a26ef;
      expv[2] = 32'h2556a35f;
      expv[3] = 32'hb4998378;
      expv[4] = 32'h7bb6911e;
      expv[5] = 32'hb492bb9d;
      expv[6] = 32'h2c0f25cc;
      expv[7] = 32'h30074f5a;
      expv[8] = 32'hf52227a3;
      expv[9] = 32'h4e0fb434;
      expv[10] = 32'hccef8ec3;
      expv[11] = 32'h9d224d5f;
      expv[12] = 32'hfa6f2f73;
      expv[13] = 32'ha5bd6ea3;
      expv[14] = 32'hb52ea255;
      expv[15] = 32'h631a89a7;
      expv[16] = 32'h024b2890;
      expv[17] = 32'he5794820;
      expv[18] = 32'h3b06e6c8;
      expv[19] = 32'h4627e40b;
      expv[20] = 32'hebf91675;
      expv[21] = 32'h6af66378;
      expv[22] = 32'h53fb0ea6;
      expv[23] = 32'h8f240cd2;
      expv[24] = 32'h0c0f6c62;
      expv[25] = 32'hfb9f9bc5;
      expv[26] = 32'h9a2b6999;
      expv[27] = 32'h50432cd1;
      expv[28] = 32'h90f9015e;
      expv[29] = 32'hda9c8868;
      expv[30] = 32'h1def8a49;
      expv[31] = 32'hfb792e42;
      expv[32] = 32'h66175d64;
      expv[33] = 32'h2669cc49;
      expv[34] = 32'h686c18ab;
      expv[35] = 32'h4c6ac2ac;
      expv[36] = 32'hb0c1e6af;
      expv[37] = 32'h944d8c4c;
      expv[38] = 32'h7cd6a7c5;
      expv[39] = 32'hc85184a5;
      expv[40] = 32'h3d9ba580;
      expv[41] = 32'h2933e76a;
      expv[42] = 32'h2b67dbc5;
      expv[43] = 32'hcfd76302;
      expv[44] = 32'h52427179;
      expv[45] = 32'he0861853;
      expv[46] = 32'hefc10f09;
      expv[47] = 32'h84c8b00a;
      expv[48] = 32'h84a45019;
      expv[49] = 32'h980f2b06;
      expv[50] = 32'h05415d14;
      expv[51] = 32'hc726c490;
      expv[52] = 32'h297df6c2;
      expv[53] = 32'haf72c73e;
      expv[54] = 32'hea65f3a7;
      expv[55] = 32'h258a5e3f;
      expv[56] = 32'h028e6849;
      expv[57] = 32'h586c5c78;
      expv[58] = 32'h37d011f2;
      expv[59] = 32'h7bdcb705;
      expv[60] = 32'heb03b11c;
      expv[61] = 32'h67150037;
      expv[62] = 32'hf3e4ca5e;
      expv[63] = 32'h95e18cba;
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
