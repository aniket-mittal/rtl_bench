// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02733 dut (
    .clk(clk),
    .ce(in_vec[72:72]),
    .flags(in_vec[71:40]),
    .prg_ain(in_vec[39:24]),
    .prg_read(in_vec[23:23]),
    .prg_write(in_vec[22:22]),
    .prg_din(in_vec[21:14]),
    .chr_ain(in_vec[13:0]),
    .prg_aout(out_vec[47:26]),
    .prg_allow(out_vec[25:25]),
    .chr_aout(out_vec[24:3]),
    .chr_allow(out_vec[2:2]),
    .vram_a10(out_vec[1:1]),
    .vram_ce(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h13b6d106c4f7a59f5ad;
    stim[1] = 73'h11039abfcbb2df6e7ff;
    stim[2] = 73'h0ce9585653dd7d4dc9f;
    stim[3] = 73'h0105171ad2cb336b216;
    stim[4] = 73'h0bd77e268ff807bf868;
    stim[5] = 73'h1a75cb3e1bff5e445b0;
    stim[6] = 73'h19793044e32b3655318;
    stim[7] = 73'h05ecb75bed568a0a30e;
    stim[8] = 73'h048ac32784d278fb5fb;
    stim[9] = 73'h14149e78e881b0f5d17;
    stim[10] = 73'h00bec88b039229aa055;
    stim[11] = 73'h0759607825ca5997c68;
    stim[12] = 73'h0bb706b378d41ca6c8d;
    stim[13] = 73'h0e02c732e0180b21268;
    stim[14] = 73'h00f6d6010cc5ded165e;
    stim[15] = 73'h156438aa082a5a963c0;
    stim[16] = 73'h12a981b0da47a28a690;
    stim[17] = 73'h1480a7208baef5bd30f;
    stim[18] = 73'h1f03a8ceb7d4d659f04;
    stim[19] = 73'h02171eede53ad101f88;
    stim[20] = 73'h15f27d98cb6f16694e9;
    stim[21] = 73'h10fb4a25f811f59dd66;
    stim[22] = 73'h1be0fbf26863826b096;
    stim[23] = 73'h10f96bfbff8f07f6bdb;
    stim[24] = 73'h02cfeec56bda9abf34d;
    stim[25] = 73'h1e7965107a6bb79a6f8;
    stim[26] = 73'h1f51dc849a720ad524c;
    stim[27] = 73'h09b15d138e08365ad00;
    stim[28] = 73'h0075c8933e7b7c688ee;
    stim[29] = 73'h0d2adfaa8c4f5dcd0ec;
    stim[30] = 73'h05a5e4d104a90e93e7d;
    stim[31] = 73'h1c89e0ed3a8087c259c;
    stim[32] = 73'h09ef20d23d8f2695362;
    stim[33] = 73'h16ba5d038ab5096ac43;
    stim[34] = 73'h1980940533e598f4621;
    stim[35] = 73'h006952c667b343ac6d4;
    stim[36] = 73'h1c177774f6aa4cd34de;
    stim[37] = 73'h1e23bb25f215e58d2d2;
    stim[38] = 73'h01caa1f22dddd228b3c;
    stim[39] = 73'h140bf3cad5b16413bf2;
    stim[40] = 73'h0bd65a8898b5160bb3b;
    stim[41] = 73'h0db2097386ecd670811;
    stim[42] = 73'h1de3b9d7647a66b1e5a;
    stim[43] = 73'h0b04462c7095ec90e95;
    stim[44] = 73'h15a5dc0cc6f3f67418f;
    stim[45] = 73'h0eb82f8d27eb73804b8;
    stim[46] = 73'h1725686218e643cae3a;
    stim[47] = 73'h0e11e5c231e7227130f;
    stim[48] = 73'h0a0d7dd6c0b1b17e193;
    stim[49] = 73'h0ceef545560d2a47043;
    stim[50] = 73'h076ef6721d6b819af40;
    stim[51] = 73'h106b6f679cde08153e1;
    stim[52] = 73'h1195d005819382671df;
    stim[53] = 73'h09c54bbd633e84dad4a;
    stim[54] = 73'h176214c73c2ddfa4fd7;
    stim[55] = 73'h077f1b27f9d81422af9;
    stim[56] = 73'h17094634d5bb7cce111;
    stim[57] = 73'h0aa34c438940122f872;
    stim[58] = 73'h0c433e26f23e0a79152;
    stim[59] = 73'h11c171b5e109501ac25;
    stim[60] = 73'h079edbef7c0ae48dbed;
    stim[61] = 73'h1e1047494804667ea43;
    stim[62] = 73'h01c4f45fd859f1ea773;
    stim[63] = 73'h0040161e2b6dc3404df;
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
      expv[0] = 48'h013de900ad69;
      expv[1] = 48'h00ecb5003ffd;
      expv[2] = 48'h00f75d00e4fe;
      expv[3] = 48'h00b2cd0090b1;
      expv[4] = 48'h01fe0100c345;
      expv[5] = 48'h00ffd5002d84;
      expv[6] = 48'h00cacd0098c0;
      expv[7] = 48'h0155a3001871;
      expv[8] = 48'h01349d00afd9;
      expv[9] = 48'h00206f00e8be;
      expv[10] = 48'h00e4890002ad;
      expv[11] = 48'h01729500e343;
      expv[12] = 48'h00350500646b;
      expv[13] = 48'h000601009340;
      expv[14] = 48'h01317500b2f2;
      expv[15] = 48'h000a97001e05;
      expv[16] = 48'h0091eb003481;
      expv[17] = 48'h00ebbd009878;
      expv[18] = 48'h01f53500f826;
      expv[19] = 48'h014eb500fc46;
      expv[20] = 48'h00dbc500a74e;
      expv[21] = 48'h00047d00eb36;
      expv[22] = 48'h0018e30084b5;
      expv[23] = 48'h01e3c1005edf;
      expv[24] = 48'h00f6a7009a6d;
      expv[25] = 48'h009aed0037c3;
      expv[26] = 48'h009c83009264;
      expv[27] = 48'h01820d006807;
      expv[28] = 48'h019edd004776;
      expv[29] = 48'h0113d5008764;
      expv[30] = 48'h012a4100f3eb;
      expv[31] = 48'h00a021002ce1;
      expv[32] = 48'h0163c9009b10;
      expv[33] = 48'h00ad4300621f;
      expv[34] = 48'h00f96500310a;
      expv[35] = 48'h01ecd10036a0;
      expv[36] = 48'h01aa9100a6f3;
      expv[37] = 48'h008579009694;
      expv[38] = 48'h0177770059e2;
      expv[39] = 48'h016c5900df93;
      expv[40] = 48'h002d4500d9df;
      expv[41] = 48'h01bb3500408e;
      expv[42] = 48'h011e9900f2d6;
      expv[43] = 48'h0025790074aa;
      expv[44] = 48'h01bcfd000c7c;
      expv[45] = 48'h01fadd0025c6;
      expv[46] = 48'h0039930071d7;
      expv[47] = 48'h0079c9009878;
      expv[48] = 48'h002c6d000c9d;
      expv[49] = 48'h018349008219;
      expv[50] = 48'h015ae3007a03;
      expv[51] = 48'h013783009f0c;
      expv[52] = 48'h0064e1008ef9;
      expv[53] = 48'h00cfa1006a57;
      expv[54] = 48'h010b75007eba;
      expv[55] = 48'h0076050057cf;
      expv[56] = 48'h016edd000889;
      expv[57] = 48'h00500700c395;
      expv[58] = 48'h008f81008a94;
      expv[59] = 48'h00425500612b;
      expv[60] = 48'h0102b900df6e;
      expv[61] = 48'h000119005219;
      expv[62] = 48'h00167f003b9b;
      expv[63] = 48'h00db730026fa;
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
