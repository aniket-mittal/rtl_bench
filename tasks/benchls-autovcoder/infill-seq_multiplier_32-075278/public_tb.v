// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075278 dut (
    .clk_i(clk),
    .rst_i(in_vec[66:66]),
    .stall_d(in_vec[65:65]),
    .kill_x(in_vec[64:64]),
    .operand_0_d(in_vec[63:32]),
    .operand_1_d(in_vec[31:0]),
    .result_x(out_vec[32:1]),
    .stall_request_x(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h60f75358244f1d020;
    stim[1] = 67'h4dda88f00ed1a8a65;
    stim[2] = 67'h0aef6205dca1d083c;
    stim[3] = 67'h072d859d2f9195710;
    stim[4] = 67'h1b3a07808e158debd;
    stim[5] = 67'h3a230cfd33627dd3c;
    stim[6] = 67'h236e31015823d666d;
    stim[7] = 67'h1640909963b8497e4;
    stim[8] = 67'h21b356e84adb78dc6;
    stim[9] = 67'h19d44a3156aa2e9a4;
    stim[10] = 67'h025d809e7ca7347ef;
    stim[11] = 67'h205b39faf915120ac;
    stim[12] = 67'h0a46d0ba7d7d91601;
    stim[13] = 67'h322e6e246773dbdf3;
    stim[14] = 67'h311dd13804a1b0194;
    stim[15] = 67'h1e5d70e68d53aba60;
    stim[16] = 67'h00b7fcbb9f5a817e3;
    stim[17] = 67'h065c1d9a3bce97cc6;
    stim[18] = 67'h332648d952191d49d;
    stim[19] = 67'h39f00e292ae4c563a;
    stim[20] = 67'h1932f2792d771bb2d;
    stim[21] = 67'h6edb1239c7be4e8ab;
    stim[22] = 67'h0c358046dbf0e5b5c;
    stim[23] = 67'h0c5ae2c2263fdc7c5;
    stim[24] = 67'h1c0bf40f4fb4d3b0b;
    stim[25] = 67'h36aa32a61e5851f2f;
    stim[26] = 67'h281dce8633c1c9b85;
    stim[27] = 67'h21fe31d4f427a5599;
    stim[28] = 67'h08a673b0c9d0e08ea;
    stim[29] = 67'h2e270f0afc7c21583;
    stim[30] = 67'h095833f460f5eed48;
    stim[31] = 67'h3ffce0259470c8fe9;
    stim[32] = 67'h0e2ae1ddceaa5e319;
    stim[33] = 67'h2ebaabd77da859a2b;
    stim[34] = 67'h0714c9671fe48b8c3;
    stim[35] = 67'h0d110807bf97b7d97;
    stim[36] = 67'h1590ad4fd23b203b2;
    stim[37] = 67'h20df642037f620e78;
    stim[38] = 67'h20a54e2fe6d9d768f;
    stim[39] = 67'h025f3e167a6c20037;
    stim[40] = 67'h0b0bb42e0c922decd;
    stim[41] = 67'h0c473c36dc707d5c5;
    stim[42] = 67'h1daef7d55e848f440;
    stim[43] = 67'h020c01ad454150b3b;
    stim[44] = 67'h2ffa530221c87fdc4;
    stim[45] = 67'h31180dd4e0b7107d2;
    stim[46] = 67'h18927e5f00328ea9d;
    stim[47] = 67'h332eeaaf2df932da7;
    stim[48] = 67'h3a540628694ca66c6;
    stim[49] = 67'h2aa5680b43f3ce601;
    stim[50] = 67'h33d168df54e5dba79;
    stim[51] = 67'h12fe8ebf0fed33f0e;
    stim[52] = 67'h2379d0abc06e02f18;
    stim[53] = 67'h29e6001f2d47b2ae6;
    stim[54] = 67'h3853e107928c6537c;
    stim[55] = 67'h0c91701cbbe9c2e19;
    stim[56] = 67'h05c21d8afe1d7818d;
    stim[57] = 67'h1b65a142b2e93c67d;
    stim[58] = 67'h1c95dae05bf7115d5;
    stim[59] = 67'h04525c12472327ae0;
    stim[60] = 67'h3dae80dd453fbf7a0;
    stim[61] = 67'h14240018267045e7b;
    stim[62] = 67'h062f59f43ce546168;
    stim[63] = 67'h213f3f7cd0f29b402;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
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
