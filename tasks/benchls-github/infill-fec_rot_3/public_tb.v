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

  fec_rot_3 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hcd27929b;
    stim[1] = 32'hd86d1b3b;
    stim[2] = 32'h7c0100e6;
    stim[3] = 32'h2a630ae6;
    stim[4] = 32'hb5746dd1;
    stim[5] = 32'h991ad0c0;
    stim[6] = 32'h208b8451;
    stim[7] = 32'h1c20c237;
    stim[8] = 32'h160d3cce;
    stim[9] = 32'h46bfefe8;
    stim[10] = 32'hf1008cfd;
    stim[11] = 32'ha12bebd7;
    stim[12] = 32'h34f26f4f;
    stim[13] = 32'h0eac77b9;
    stim[14] = 32'hc2c4da16;
    stim[15] = 32'h13a07218;
    stim[16] = 32'h642bb7a7;
    stim[17] = 32'hf217001b;
    stim[18] = 32'hdba0c9ac;
    stim[19] = 32'h518acc76;
    stim[20] = 32'h42a50f0a;
    stim[21] = 32'h962e0964;
    stim[22] = 32'h50fbb5d2;
    stim[23] = 32'h36095a8a;
    stim[24] = 32'hce87a961;
    stim[25] = 32'h6b4a67e2;
    stim[26] = 32'h7700f728;
    stim[27] = 32'h95179e37;
    stim[28] = 32'hb8ff456e;
    stim[29] = 32'hfff21ece;
    stim[30] = 32'h440c10f9;
    stim[31] = 32'h98737d9e;
    stim[32] = 32'h7bb51bdd;
    stim[33] = 32'he9d39fad;
    stim[34] = 32'h232358e9;
    stim[35] = 32'h78783d3e;
    stim[36] = 32'h70c2ae04;
    stim[37] = 32'h49cb2750;
    stim[38] = 32'h10101273;
    stim[39] = 32'he3d2a428;
    stim[40] = 32'hb017b9d5;
    stim[41] = 32'h58451789;
    stim[42] = 32'hcfe2c675;
    stim[43] = 32'h660c74c3;
    stim[44] = 32'hac406b48;
    stim[45] = 32'hde6626f4;
    stim[46] = 32'h97259039;
    stim[47] = 32'h40b29820;
    stim[48] = 32'h1ed8fb3d;
    stim[49] = 32'hdf19b643;
    stim[50] = 32'h5b4853be;
    stim[51] = 32'hf849ad11;
    stim[52] = 32'h99b2f21a;
    stim[53] = 32'h6431f997;
    stim[54] = 32'h80ac95d4;
    stim[55] = 32'haa6cee92;
    stim[56] = 32'hd275e8bc;
    stim[57] = 32'ha6027e81;
    stim[58] = 32'hbbedb6c6;
    stim[59] = 32'hcb67282c;
    stim[60] = 32'hc506bfec;
    stim[61] = 32'habbe2f3b;
    stim[62] = 32'he0637fbc;
    stim[63] = 32'ha02ab2a6;
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
      expv[0] = 32'h6afca4c6;
      expv[1] = 32'hc0a8e9c6;
      expv[2] = 32'he1e81f3f;
      expv[3] = 32'h53b85f35;
      expv[4] = 32'ha9834699;
      expv[5] = 32'hca56a614;
      expv[6] = 32'h04fc2a8d;
      expv[7] = 32'he10611b8;
      expv[8] = 32'hb069e670;
      expv[9] = 32'h34bf6f4a;
      expv[10] = 32'h8b645ff3;
      expv[11] = 32'h0b7f76a9;
      expv[12] = 32'ha733727d;
      expv[13] = 32'h7563bdc8;
      expv[14] = 32'h15e6e0ae;
      expv[15] = 32'h9d0390c0;
      expv[16] = 32'h20bda537;
      expv[17] = 32'h93d838c3;
      expv[18] = 32'hdec67d7e;
      expv[19] = 32'h8d1673ba;
      expv[20] = 32'h1468685a;
      expv[21] = 32'hb3f06b34;
      expv[22] = 32'h869dbe9a;
      expv[23] = 32'hb0eadc55;
      expv[24] = 32'h77fd7b16;
      expv[25] = 32'h5bb3271f;
      expv[26] = 32'hb9e7a14f;
      expv[27] = 32'haa3cd1ac;
      expv[28] = 32'hc5da0361;
      expv[29] = 32'hfcf0ce6b;
      expv[30] = 32'h212097c2;
      expv[31] = 32'hc11bcce4;
      expv[32] = 32'hdc48c6e7;
      expv[33] = 32'h4dfcc573;
      expv[34] = 32'h19bacf4d;
      expv[35] = 32'hc221f1ff;
      expv[36] = 32'h87f5682f;
      expv[37] = 32'h4f192a8a;
      expv[38] = 32'h80809398;
      expv[39] = 32'h1df5195b;
      expv[40] = 32'h829de6b9;
      expv[41] = 32'hc368ac42;
      expv[42] = 32'h7cd603b6;
      expv[43] = 32'h3183be17;
      expv[44] = 32'h60237251;
      expv[45] = 32'hf0f107be;
      expv[46] = 32'hbbaca1dc;
      expv[47] = 32'h04d4d10a;
      expv[48] = 32'hf6c7d9e8;
      expv[49] = 32'hfb0d8206;
      expv[50] = 32'hdb028dfa;
      expv[51] = 32'hc12d5093;
      expv[52] = 32'hcf17b0c4;
      expv[53] = 32'h206fd4b7;
      expv[54] = 32'h07e48eb4;
      expv[55] = 32'h51475c81;
      expv[56] = 32'h906f75fe;
      expv[57] = 32'h3233dc19;
      expv[58] = 32'hdd4d9e21;
      expv[59] = 32'h58f9717e;
      expv[60] = 32'h2bf5cf7e;
      expv[61] = 32'h5fd151c9;
      expv[62] = 32'h007bc5fb;
      expv[63] = 32'h0375bd21;
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
