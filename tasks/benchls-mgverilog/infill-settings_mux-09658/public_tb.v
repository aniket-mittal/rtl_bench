// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09658 dut (
    .clock(clk),
    .resetn(in_vec[67:67]),
    .i_settings(in_vec[66:66]),
    .i_register_settings(in_vec[65:34]),
    .i_datain(in_vec[33:2]),
    .i_datain_valid(in_vec[1:1]),
    .i_dataout_stall(in_vec[0:0]),
    .o_datain_stall(out_vec[33:33]),
    .o_dataout(out_vec[32:1]),
    .o_dataout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h364bb6826420709cb;
    stim[1] = 68'h6e5f23c5103866745;
    stim[2] = 68'h80a846d8c554e5db9;
    stim[3] = 68'hf73394a5f8f03f3d2;
    stim[4] = 68'hf2daba0c98c9d83ca;
    stim[5] = 68'hb1c0e65194a56066d;
    stim[6] = 68'he3627b4f65d2ea8a0;
    stim[7] = 68'h93fe653c0206097e4;
    stim[8] = 68'he6dd4a9d4e9139ec4;
    stim[9] = 68'he1c3de522ad612833;
    stim[10] = 68'he427cc44d3aa49cd6;
    stim[11] = 68'h99c0cd016617d60ad;
    stim[12] = 68'hd30ebaf7a9a4b7be0;
    stim[13] = 68'haf0e319225450411f;
    stim[14] = 68'he2a45cf05988908d7;
    stim[15] = 68'hcbbbfa1756b725aaf;
    stim[16] = 68'hbdb09780f2a252554;
    stim[17] = 68'hcc2d6fb8807594d1d;
    stim[18] = 68'hc979e14c335c3368c;
    stim[19] = 68'h807a668074f0949d4;
    stim[20] = 68'h8250a62195baa1e2d;
    stim[21] = 68'hf3fd2d50c2f412e5d;
    stim[22] = 68'hfc08778274426c888;
    stim[23] = 68'he8bf32d1ba989b823;
    stim[24] = 68'hbd2d5696352e9c871;
    stim[25] = 68'hb6f561e87d0d7a702;
    stim[26] = 68'h88d7c6ed39e212dcb;
    stim[27] = 68'hb49e0c87cdff252f9;
    stim[28] = 68'he907b24c050d72a1f;
    stim[29] = 68'h882b2ff06b193c80c;
    stim[30] = 68'h9145ace3a17529daf;
    stim[31] = 68'hae6b58c00fc71c7e9;
    stim[32] = 68'hd1f0fc8890c59d68a;
    stim[33] = 68'hb2c71fe6aa744bc05;
    stim[34] = 68'he7eb86d6b16e1e26d;
    stim[35] = 68'heb52635e2e7a4e913;
    stim[36] = 68'hf210d2db77b8e3508;
    stim[37] = 68'hfc9d3c76ec5cc33c8;
    stim[38] = 68'he8cf988dca07a6538;
    stim[39] = 68'hbc7356e67a742a4a2;
    stim[40] = 68'hb763ea2340bb32907;
    stim[41] = 68'hbefc828a9d0893b2c;
    stim[42] = 68'he35259a903e18a0d8;
    stim[43] = 68'ha69df9b255cee02c7;
    stim[44] = 68'h92d3633256c443eb6;
    stim[45] = 68'h91538d71f35941b7c;
    stim[46] = 68'hb538420e5b1aa671b;
    stim[47] = 68'hc866db76b6f715062;
    stim[48] = 68'hff2dc8876075eb118;
    stim[49] = 68'hd85c0e3f4c45cec7e;
    stim[50] = 68'hb7ad5338e50d04225;
    stim[51] = 68'hfc5487037a69443e7;
    stim[52] = 68'hfa4c48ac7a25e1b4d;
    stim[53] = 68'h93d1420a415408104;
    stim[54] = 68'h9c9a76c4a02171302;
    stim[55] = 68'hd82a604250c597ca9;
    stim[56] = 68'h8712cfcea60e45be1;
    stim[57] = 68'h8758dc9d687b8d226;
    stim[58] = 68'hb37a874a82e917785;
    stim[59] = 68'h9ebda9e190482e91b;
    stim[60] = 68'hb7916b9d686ce0fd1;
    stim[61] = 68'hf76e49124da63dd16;
    stim[62] = 68'hd905288e74062d99a;
    stim[63] = 68'ha15a6f06295bc8905;
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
      expv[0] = 34'h3210384e5;
      expv[1] = 34'h372f91e28;
      expv[2] = 34'h22aa72edc;
      expv[3] = 34'h1b99ca52f;
      expv[4] = 34'h196d5d065;
      expv[5] = 34'h2a52b0336;
      expv[6] = 34'h11b13da7a;
      expv[7] = 34'h010304bf2;
      expv[8] = 34'h136ea54ea;
      expv[9] = 34'h30e1ef291;
      expv[10] = 34'h1213e6227;
      expv[11] = 34'h330beb056;
      expv[12] = 34'h09875d7bc;
      expv[13] = 34'h32a28208f;
      expv[14] = 34'h31522e783;
      expv[15] = 34'h25ddfd0bb;
      expv[16] = 34'h1951292aa;
      expv[17] = 34'h2616b7dc4;
      expv[18] = 34'h04bcf0a60;
      expv[19] = 34'h1a784a4ea;
      expv[20] = 34'h2add50f16;
      expv[21] = 34'h39fe96a86;
      expv[22] = 34'h1e043bc12;
      expv[23] = 34'h345f9968d;
      expv[24] = 34'h3a974e438;
      expv[25] = 34'h1e86bd381;
      expv[26] = 34'h3cf1096e5;
      expv[27] = 34'h26ff9297c;
      expv[28] = 34'h3483d9261;
      expv[29] = 34'h158c9e406;
      expv[30] = 34'h30ba94ed7;
      expv[31] = 34'h27e38e3f4;
      expv[32] = 34'h08f87e445;
      expv[33] = 34'h353a25e02;
      expv[34] = 34'h33f5c36b4;
      expv[35] = 34'h35a931af1;
      expv[36] = 34'h1908696da;
      expv[37] = 34'h1e4e9e3b6;
      expv[38] = 34'h1467cc46e;
      expv[39] = 34'h1d3a15251;
      expv[40] = 34'h205d99483;
      expv[41] = 34'h0e8449d96;
      expv[42] = 34'h11a92cd48;
      expv[43] = 34'h2ae770163;
      expv[44] = 34'h0b6221f5b;
      expv[45] = 34'h19aca0dbe;
      expv[46] = 34'h2d8d5338d;
      expv[47] = 34'h04336dbb5;
      expv[48] = 34'h1f96e443a;
      expv[49] = 34'h0c2e071fb;
      expv[50] = 34'h328682112;
      expv[51] = 34'h3e2a4381b;
      expv[52] = 34'h3d2624562;
      expv[53] = 34'h00aa04082;
      expv[54] = 34'h1010b8981;
      expv[55] = 34'h2c1530212;
      expv[56] = 34'h330722df0;
      expv[57] = 34'h143dc6913;
      expv[58] = 34'h21748bbc2;
      expv[59] = 34'h28241748d;
      expv[60] = 34'h3436707e8;
      expv[61] = 34'h1bb724893;
      expv[62] = 34'h0c8294473;
      expv[63] = 34'h34ade4482;
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
