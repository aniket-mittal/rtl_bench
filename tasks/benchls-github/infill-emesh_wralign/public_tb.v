// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  emesh_wralign dut (
    .datamode(in_vec[65:64]),
    .data_in(in_vec[63:0]),
    .data_out(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h38a392561d1259405;
    stim[1] = 66'h3430a7d09ac07dbf1;
    stim[2] = 66'h1fea7cd5ed83d5d88;
    stim[3] = 66'h34f437b4f6973e9c2;
    stim[4] = 66'h333f5f9ddfba8ae68;
    stim[5] = 66'h29e15393ea05634b0;
    stim[6] = 66'h1d83aab6ebe7f57d2;
    stim[7] = 66'h21c0b25d3854fc539;
    stim[8] = 66'h3f98a558b6d99f655;
    stim[9] = 66'h179445535e5d49211;
    stim[10] = 66'h167af5ded7f8b6a50;
    stim[11] = 66'h05c5cd13de57fa6cd;
    stim[12] = 66'h12a26c02b72ac46b1;
    stim[13] = 66'h31fd7470cb0e4197a;
    stim[14] = 66'h3beec631698319ed9;
    stim[15] = 66'h05c8d334350cd77ef;
    stim[16] = 66'h2c89c71a9a2f500c0;
    stim[17] = 66'h38d25a1816d94b5ae;
    stim[18] = 66'h38ba6d4bb84435446;
    stim[19] = 66'h3dfcee2d5d2bcecc6;
    stim[20] = 66'h16690c24dda8341e0;
    stim[21] = 66'h3104aa62d1060afa2;
    stim[22] = 66'h2b9523e149ad0d50e;
    stim[23] = 66'h156809e77585066f7;
    stim[24] = 66'h3ab82f6be83b22514;
    stim[25] = 66'h141392fdf29f6e734;
    stim[26] = 66'h3c57e3ff272b5de4c;
    stim[27] = 66'h0c7e19d40d2fd21d7;
    stim[28] = 66'h38c6542463a491e0b;
    stim[29] = 66'h28e2297d5f49af607;
    stim[30] = 66'h2fb8e21d40ce2c065;
    stim[31] = 66'h10f18ab69f898fb83;
    stim[32] = 66'h1f764e81c45529d4f;
    stim[33] = 66'h05a66cd4b50be0389;
    stim[34] = 66'h36038c9d866f4a45a;
    stim[35] = 66'h37cbeb4fbc9dff68e;
    stim[36] = 66'h0ae70be8028199b10;
    stim[37] = 66'h33df834d9a7a391e1;
    stim[38] = 66'h3cb5f166bf860d059;
    stim[39] = 66'h38c1893ac24b12b59;
    stim[40] = 66'h12d983306ebbdca12;
    stim[41] = 66'h24e2f1ea1101d2754;
    stim[42] = 66'h3f5e36117e3cdb263;
    stim[43] = 66'h0d51cea93ce696ed3;
    stim[44] = 66'h21be3f7c6b49af665;
    stim[45] = 66'h3e8ff5b6985889a48;
    stim[46] = 66'h1b1bf82b376115ea4;
    stim[47] = 66'h0afc002ee7de39772;
    stim[48] = 66'h1fc60a0eb21cb17a0;
    stim[49] = 66'h1ff8911a7de46d431;
    stim[50] = 66'h1a665cc2fcb87e841;
    stim[51] = 66'h037dca50c82e9ecb4;
    stim[52] = 66'h0d50642c9a38cf4ef;
    stim[53] = 66'h23391130e2e1d3e13;
    stim[54] = 66'h276ed1ebc911a74f9;
    stim[55] = 66'h105c23685ac84363f;
    stim[56] = 66'h12e6be9685be229f9;
    stim[57] = 66'h1558ac9a894671722;
    stim[58] = 66'h0fef006462ba45fe6;
    stim[59] = 66'h255d9ae0810c72591;
    stim[60] = 66'h32daf8f42551a65e7;
    stim[61] = 66'h15c1df47cd5bbb470;
    stim[62] = 66'h165506a00a25b7c59;
    stim[63] = 66'h36143c5ec62d32e4c;
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
      expv[0] = 64'h8a392561d1259405;
      expv[1] = 64'h430a7d09ac07dbf1;
      expv[2] = 64'h5d885d885d885d88;
      expv[3] = 64'h4f437b4f6973e9c2;
      expv[4] = 64'h33f5f9ddfba8ae68;
      expv[5] = 64'ha05634b0a05634b0;
      expv[6] = 64'h57d257d257d257d2;
      expv[7] = 64'h854fc539854fc539;
      expv[8] = 64'hf98a558b6d99f655;
      expv[9] = 64'h9211921192119211;
      expv[10] = 64'h6a506a506a506a50;
      expv[11] = 64'hcdcdcdcdcdcdcdcd;
      expv[12] = 64'h46b146b146b146b1;
      expv[13] = 64'h1fd7470cb0e4197a;
      expv[14] = 64'hbeec631698319ed9;
      expv[15] = 64'hefefefefefefefef;
      expv[16] = 64'ha2f500c0a2f500c0;
      expv[17] = 64'h8d25a1816d94b5ae;
      expv[18] = 64'h8ba6d4bb84435446;
      expv[19] = 64'hdfcee2d5d2bcecc6;
      expv[20] = 64'h41e041e041e041e0;
      expv[21] = 64'h104aa62d1060afa2;
      expv[22] = 64'h9ad0d50e9ad0d50e;
      expv[23] = 64'h66f766f766f766f7;
      expv[24] = 64'hab82f6be83b22514;
      expv[25] = 64'he734e734e734e734;
      expv[26] = 64'hc57e3ff272b5de4c;
      expv[27] = 64'hd7d7d7d7d7d7d7d7;
      expv[28] = 64'h8c6542463a491e0b;
      expv[29] = 64'hf49af607f49af607;
      expv[30] = 64'h0ce2c0650ce2c065;
      expv[31] = 64'hfb83fb83fb83fb83;
      expv[32] = 64'h9d4f9d4f9d4f9d4f;
      expv[33] = 64'h8989898989898989;
      expv[34] = 64'h6038c9d866f4a45a;
      expv[35] = 64'h7cbeb4fbc9dff68e;
      expv[36] = 64'h1010101010101010;
      expv[37] = 64'h3df834d9a7a391e1;
      expv[38] = 64'hcb5f166bf860d059;
      expv[39] = 64'h8c1893ac24b12b59;
      expv[40] = 64'hca12ca12ca12ca12;
      expv[41] = 64'h101d2754101d2754;
      expv[42] = 64'hf5e36117e3cdb263;
      expv[43] = 64'hd3d3d3d3d3d3d3d3;
      expv[44] = 64'hb49af665b49af665;
      expv[45] = 64'he8ff5b6985889a48;
      expv[46] = 64'h5ea45ea45ea45ea4;
      expv[47] = 64'h7272727272727272;
      expv[48] = 64'h17a017a017a017a0;
      expv[49] = 64'hd431d431d431d431;
      expv[50] = 64'he841e841e841e841;
      expv[51] = 64'hb4b4b4b4b4b4b4b4;
      expv[52] = 64'hefefefefefefefef;
      expv[53] = 64'h2e1d3e132e1d3e13;
      expv[54] = 64'h911a74f9911a74f9;
      expv[55] = 64'h363f363f363f363f;
      expv[56] = 64'h29f929f929f929f9;
      expv[57] = 64'h1722172217221722;
      expv[58] = 64'he6e6e6e6e6e6e6e6;
      expv[59] = 64'h10c7259110c72591;
      expv[60] = 64'h2daf8f42551a65e7;
      expv[61] = 64'hb470b470b470b470;
      expv[62] = 64'h7c597c597c597c59;
      expv[63] = 64'h6143c5ec62d32e4c;
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
