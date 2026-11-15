// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07395 dut (
    .a(in_vec[32:1]),
    .lsb(in_vec[0:0]),
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
    stim[0] = 33'h00cb818f3;
    stim[1] = 33'h17080938e;
    stim[2] = 33'h05c93d369;
    stim[3] = 33'h1f6401602;
    stim[4] = 33'h165757238;
    stim[5] = 33'h1f1421a48;
    stim[6] = 33'h0c2cba0d0;
    stim[7] = 33'h0de9bd073;
    stim[8] = 33'h180f20d1f;
    stim[9] = 33'h01b974f60;
    stim[10] = 33'h123e0ed7c;
    stim[11] = 33'h0fa4aab46;
    stim[12] = 33'h046e1096e;
    stim[13] = 33'h195cec451;
    stim[14] = 33'h090236628;
    stim[15] = 33'h0665e80c4;
    stim[16] = 33'h05ac13add;
    stim[17] = 33'h09053125b;
    stim[18] = 33'h0bdf54beb;
    stim[19] = 33'h06a6330c0;
    stim[20] = 33'h148a15042;
    stim[21] = 33'h1bd4c2669;
    stim[22] = 33'h023cdef44;
    stim[23] = 33'h1ce43420c;
    stim[24] = 33'h03cf1ed06;
    stim[25] = 33'h01a043375;
    stim[26] = 33'h1e6c67abc;
    stim[27] = 33'h0c1d6aa72;
    stim[28] = 33'h10df03cd4;
    stim[29] = 33'h0405644a7;
    stim[30] = 33'h1d7e7729e;
    stim[31] = 33'h0c337bc1f;
    stim[32] = 33'h08beef2a1;
    stim[33] = 33'h1fac78a26;
    stim[34] = 33'h136ee593e;
    stim[35] = 33'h18862ba90;
    stim[36] = 33'h090391498;
    stim[37] = 33'h0d611c4d4;
    stim[38] = 33'h040310ecf;
    stim[39] = 33'h1fbc4d92c;
    stim[40] = 33'h1bafc1115;
    stim[41] = 33'h1c03f9b48;
    stim[42] = 33'h082c2db6c;
    stim[43] = 33'h07bdc8474;
    stim[44] = 33'h00d19922c;
    stim[45] = 33'h1eac700ba;
    stim[46] = 33'h1af0b0efd;
    stim[47] = 33'h15f64574f;
    stim[48] = 33'h0c22f814a;
    stim[49] = 33'h025a868bc;
    stim[50] = 33'h11fbf4a16;
    stim[51] = 33'h163b04729;
    stim[52] = 33'h1301a7685;
    stim[53] = 33'h1a65d9f3c;
    stim[54] = 33'h118a4fc9f;
    stim[55] = 33'h18bbe68b2;
    stim[56] = 33'h10ac84152;
    stim[57] = 33'h085e1aba7;
    stim[58] = 33'h0337c8794;
    stim[59] = 33'h019781b44;
    stim[60] = 33'h06adfbcfd;
    stim[61] = 33'h182d94354;
    stim[62] = 33'h1ab9642ed;
    stim[63] = 33'h073c2cb8e;
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
      expv[0] = 32'h65c0c79f;
      expv[1] = 32'h84049c70;
      expv[2] = 32'he49e9b4f;
      expv[3] = 32'hb200b010;
      expv[4] = 32'h2bab91c0;
      expv[5] = 32'h8a10d240;
      expv[6] = 32'h165d0680;
      expv[7] = 32'hf4de839f;
      expv[8] = 32'h079068ff;
      expv[9] = 32'hdcba7b00;
      expv[10] = 32'h1f076be0;
      expv[11] = 32'hd2555a30;
      expv[12] = 32'h37084b70;
      expv[13] = 32'hae76228f;
      expv[14] = 32'h811b3140;
      expv[15] = 32'h32f40620;
      expv[16] = 32'hd609d6ef;
      expv[17] = 32'h829892df;
      expv[18] = 32'hefaa5f5f;
      expv[19] = 32'h53198600;
      expv[20] = 32'h450a8210;
      expv[21] = 32'hea61334f;
      expv[22] = 32'h1e6f7a20;
      expv[23] = 32'h721a1060;
      expv[24] = 32'he78f6830;
      expv[25] = 32'hd0219baf;
      expv[26] = 32'h3633d5e0;
      expv[27] = 32'h0eb55390;
      expv[28] = 32'h6f81e6a0;
      expv[29] = 32'h02b2253f;
      expv[30] = 32'hbf3b94f0;
      expv[31] = 32'h19bde0ff;
      expv[32] = 32'h5f77950f;
      expv[33] = 32'hd63c5130;
      expv[34] = 32'hb772c9f0;
      expv[35] = 32'h4315d480;
      expv[36] = 32'h81c8a4c0;
      expv[37] = 32'hb08e26a0;
      expv[38] = 32'h0188767f;
      expv[39] = 32'hde26c960;
      expv[40] = 32'hd7e088af;
      expv[41] = 32'h01fcda40;
      expv[42] = 32'h1616db60;
      expv[43] = 32'hdee423a0;
      expv[44] = 32'h68cc9160;
      expv[45] = 32'h563805d0;
      expv[46] = 32'h785877ef;
      expv[47] = 32'hfb22ba7f;
      expv[48] = 32'h117c0a50;
      expv[49] = 32'h2d4345e0;
      expv[50] = 32'hfdfa50b0;
      expv[51] = 32'h1d82394f;
      expv[52] = 32'h80d3b42f;
      expv[53] = 32'h32ecf9e0;
      expv[54] = 32'hc527e4ff;
      expv[55] = 32'h5df34590;
      expv[56] = 32'h56420a90;
      expv[57] = 32'h2f0d5d3f;
      expv[58] = 32'h9be43ca0;
      expv[59] = 32'hcbc0da20;
      expv[60] = 32'h56fde7ef;
      expv[61] = 32'h16ca1aa0;
      expv[62] = 32'h5cb2176f;
      expv[63] = 32'h9e165c70;
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
