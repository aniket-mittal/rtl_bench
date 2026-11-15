// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 112;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_037692 dut (
    .clk(clk),
    .rst_n(in_vec[111:111]),
    .s_axil_awaddr(in_vec[110:79]),
    .s_axil_awprot(in_vec[78:76]),
    .s_axil_awvalid(in_vec[75:75]),
    .s_axil_wdata(in_vec[74:43]),
    .s_axil_wstrb(in_vec[42:39]),
    .s_axil_wvalid(in_vec[38:38]),
    .s_axil_bready(in_vec[37:37]),
    .s_axil_araddr(in_vec[36:5]),
    .s_axil_arprot(in_vec[4:2]),
    .s_axil_arvalid(in_vec[1:1]),
    .s_axil_rready(in_vec[0:0]),
    .s_axil_awready(out_vec[41:41]),
    .s_axil_wready(out_vec[40:40]),
    .s_axil_bresp(out_vec[39:38]),
    .s_axil_bvalid(out_vec[37:37]),
    .s_axil_arready(out_vec[36:36]),
    .s_axil_rdata(out_vec[35:4]),
    .s_axil_rresp(out_vec[3:2]),
    .s_axil_rvalid(out_vec[1:1]),
    .time_intr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 112'h34067bece44098b46e745b0243d9;
    stim[1] = 112'h423e4f90168766cc3813f72b3758;
    stim[2] = 112'hca55c37b363dc70aa17b4126aec2;
    stim[3] = 112'hed97d32a08f562775f8b982364d5;
    stim[4] = 112'hc9a7958b205ae47d09c55fccb8f2;
    stim[5] = 112'hb5cd86f58a6f45076fc3e97e9b7d;
    stim[6] = 112'hd1731055c6c0b227dee6c9ac3e82;
    stim[7] = 112'hcf0213efe2f3316e6273abd475ef;
    stim[8] = 112'he994b2828607f6bcf16b0f164a22;
    stim[9] = 112'hd5dedf88837c334d9f60b61b14f5;
    stim[10] = 112'hceec6f362c1f1f83aa8458770dc9;
    stim[11] = 112'h87dee55e8804834834f93d5e2edd;
    stim[12] = 112'hf428b75ff8a6e3c4677e2c9bacee;
    stim[13] = 112'h8c8d5ef40b954561118854ffb726;
    stim[14] = 112'hcac35350ccd7b8d3caead1296af8;
    stim[15] = 112'hbbd9d734874945e903704e98c634;
    stim[16] = 112'hc90fbabf91c85fbf2845871097e1;
    stim[17] = 112'hf6c70b0ef447b76f5826cd910efb;
    stim[18] = 112'hf1f32d6d148703a96cc1bd2cbb82;
    stim[19] = 112'he37be639bf5141b391f4829f80f9;
    stim[20] = 112'h83d03f5a04e74c096e8b39317039;
    stim[21] = 112'ha9573530526661062f85efaa0a86;
    stim[22] = 112'hf4298f1a7bd1fbef6b2bda54ee1c;
    stim[23] = 112'h9d6affbed634e5df27f28f6fc6ca;
    stim[24] = 112'hcbfdbc91949d7ad502c254e2acea;
    stim[25] = 112'hf50ead79b9b7afe1b58c334d539e;
    stim[26] = 112'hd1c26b542a9136aa513a89a66f52;
    stim[27] = 112'h881fbea6d3ec86b261bafd2d2793;
    stim[28] = 112'hd78a22b29318829626bf3d8ff345;
    stim[29] = 112'ha8d89d2c92534ef9b3b2d2b9f6bc;
    stim[30] = 112'hc6758587b0b8fdb8fcdf0c52d095;
    stim[31] = 112'hb4c369fe56f96dded6066c1f8c9e;
    stim[32] = 112'hc28e2c003d7ffb3072aa911bcbc8;
    stim[33] = 112'ha8ee6665b5956692603b89299f7c;
    stim[34] = 112'hf5b393fdc2bd17b7b3c3ad894fb7;
    stim[35] = 112'hfdb4a17031b5c872659a16e22721;
    stim[36] = 112'hf1f5da0ab369129cc887c7c8134c;
    stim[37] = 112'hc9e33689ece31c43731a0ae4fb21;
    stim[38] = 112'ha82297d44cd04d024d2a8dbae783;
    stim[39] = 112'hd87ac58fda977f9e07f449957420;
    stim[40] = 112'h9f6ec0b1a425002c633832647ca5;
    stim[41] = 112'hfed0a8ed981f2a3d1ecc75acaf63;
    stim[42] = 112'h87240c39f37a15041c717eeb8357;
    stim[43] = 112'h8af014bde3fe0c6aefb896605349;
    stim[44] = 112'ha7965d45b648841f7738fa88afe8;
    stim[45] = 112'hf5d1b4d23d32dd20ff5158de934f;
    stim[46] = 112'hd3e3549030c4ced4ef65c459b5ec;
    stim[47] = 112'ha36f985e7ef9d064e82ad0fe19ce;
    stim[48] = 112'hce330a3935b342e94148d3d362ea;
    stim[49] = 112'he091fdedc009cdbd1bb1da696a8f;
    stim[50] = 112'heffba24c465929195e30a008d23d;
    stim[51] = 112'hd6fb815f9476894dbe650af6640e;
    stim[52] = 112'hd48d3bb975183e66e25ab56dc47c;
    stim[53] = 112'hde4105401719bb635136de106eb4;
    stim[54] = 112'hfc71fd0abde9d045eff8135b9f51;
    stim[55] = 112'hd67a7342d1745acb6f1e90159c83;
    stim[56] = 112'hd7422509539144fb05bf4027fcdb;
    stim[57] = 112'hb0bb359da125815befb6bd4b9da7;
    stim[58] = 112'hfcdba5ef2513b71d0844ce84d2ca;
    stim[59] = 112'hcfd7e82a4192a4fe167cd60c2175;
    stim[60] = 112'hdd3b0bdd8540348ae1844c74b861;
    stim[61] = 112'hdec9f7dda152fa465c0980073d70;
    stim[62] = 112'he1ee0f13888007a8d3ef599bf493;
    stim[63] = 112'hdfd0bc4933f8bad9ae1bfbfe0254;
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
      expv[0] = 42'h0xxxxxxxxxx;
      expv[1] = 42'h0xxxxxxxxxx;
      expv[2] = 42'h0xxxxxxxxxx;
      expv[3] = 42'h1xxxxxxxxxx;
      expv[4] = 42'h2a00000000a;
      expv[5] = 42'h1b00000000a;
      expv[6] = 42'h2a000000008;
      expv[7] = 42'h19000000008;
      expv[8] = 42'h0a00000000a;
      expv[9] = 42'h1900000000a;
      expv[10] = 42'h0a000000008;
      expv[11] = 42'h2a000000008;
      expv[12] = 42'h18000000008;
      expv[13] = 42'h2b000000008;
      expv[14] = 42'h0a00000000a;
      expv[15] = 42'h3800000000a;
      expv[16] = 42'h0a00000000a;
      expv[17] = 42'h1a000000008;
      expv[18] = 42'h09000000008;
      expv[19] = 42'h1a00000000a;
      expv[20] = 42'h28000000008;
      expv[21] = 42'h08000000008;
      expv[22] = 42'h09000000008;
      expv[23] = 42'h2800000000a;
      expv[24] = 42'h1900000000a;
      expv[25] = 42'h0a00000000a;
      expv[26] = 42'h2b00000000a;
      expv[27] = 42'h0800000000a;
      expv[28] = 42'h09000000008;
      expv[29] = 42'h0800000000a;
      expv[30] = 42'h0800000000a;
      expv[31] = 42'h18000000008;
      expv[32] = 42'h0b000000008;
      expv[33] = 42'h2800000000a;
      expv[34] = 42'h0800000000a;
      expv[35] = 42'h19000000008;
      expv[36] = 42'h0a00000000a;
      expv[37] = 42'h0a00000000a;
      expv[38] = 42'h2a000000008;
      expv[39] = 42'h09000000008;
      expv[40] = 42'h3800000000a;
      expv[41] = 42'h0a000000008;
      expv[42] = 42'h3b000000008;
      expv[43] = 42'h0800000000a;
      expv[44] = 42'h0a000000008;
      expv[45] = 42'h08000000008;
      expv[46] = 42'h39000000008;
      expv[47] = 42'h0a00000000a;
      expv[48] = 42'h2900000000a;
      expv[49] = 42'h1800000000a;
      expv[50] = 42'h0b000000008;
      expv[51] = 42'h0800000000a;
      expv[52] = 42'h1900000000a;
      expv[53] = 42'h0a00000000a;
      expv[54] = 42'h0800000000a;
      expv[55] = 42'h38000000008;
      expv[56] = 42'h0b000000008;
      expv[57] = 42'h0800000000a;
      expv[58] = 42'h09000000008;
      expv[59] = 42'h1800000000a;
      expv[60] = 42'h0a000000008;
      expv[61] = 42'h0a000000008;
      expv[62] = 42'h0a000000008;
      expv[63] = 42'h39000000008;
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
