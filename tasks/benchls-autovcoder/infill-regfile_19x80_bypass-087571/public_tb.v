// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 206;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087571 dut (
    .clk(clk),
    .ra(in_vec[205:201]),
    .re(in_vec[200:200]),
    .ore(in_vec[199:199]),
    .wa(in_vec[198:194]),
    .we(in_vec[193:193]),
    .di(in_vec[192:113]),
    .byp_sel(in_vec[112:112]),
    .dbyp(in_vec[111:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[79:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 206'h23c7a5da8558b2fdccca7068ab0d33de91086f90d312e4b757ec;
    stim[1] = 206'h3910ab8f053bed4a7d3c4011b1695da8f6cef00433ee98408c8b;
    stim[2] = 206'h1f3285f0589e5acd23ce6a34e4d6411e213416b7792194be81c0;
    stim[3] = 206'h046d6ffd2da38ebaeb0fe6ad52a8e4a93e31b94c3d04fc607701;
    stim[4] = 206'h02d24360009d161af131cf80ca22d97b895fe5cb1487433078e2;
    stim[5] = 206'h2c309c7d1ae9590076f46d1872c3559b3e800b1f7a398eb1456a;
    stim[6] = 206'h3f09e83e8a9a31b698cc266651916941303794b4bb367297ead9;
    stim[7] = 206'h3bb2e9fea2a191dc4fdc83af4c6a8db6f43f8420e7844d8cbab4;
    stim[8] = 206'h1bb7ef66e9ed4da8d660691f2a48e3b56e2f8496eba874fefaea;
    stim[9] = 206'h1668cf92a2954467d927368164f700e282b9e7ba605e1380ffeb;
    stim[10] = 206'h00b3c504091be2abb0f8121eeaf1e625bd17bd98cfc326990cc9;
    stim[11] = 206'h29b06c0493462d93a906d54b6937f5c261bbc5819da028f20f12;
    stim[12] = 206'h315d1ae941daa545daa5cc23ad7aff8ae123c71564697153231d;
    stim[13] = 206'h0383ed18e81166d6fc4a858de321082353425976d954bf2c93c0;
    stim[14] = 206'h1d473f864a2e92a02691a111e21eaf270715c347cdd98399a5bd;
    stim[15] = 206'h1697ef6c5d888b8e0c9a69b2347174ede3f0996dcc705ae71d61;
    stim[16] = 206'h347419bb31fc749424ca6fa863705b82a4efc1379ca5fb6c05ae;
    stim[17] = 206'h33e5ab8d9c85e7661b6ec1c56d6b00eafc7162a3606ba5418e56;
    stim[18] = 206'h2de2561b263c93d3173e66c614e763fa38b28f02cd50f2596a27;
    stim[19] = 206'h24fc03df22f649d55e151794afa72109fca3703a969969f2a5c2;
    stim[20] = 206'h3115b8a41137fb2542e3b62c9ef062a763c1ae540d593bd8c377;
    stim[21] = 206'h052ed88e363d466d5568112721cf73a231dce65ced8e263023c0;
    stim[22] = 206'h176dd310effd6998522af066d0984b33f395c602eb732f863bb1;
    stim[23] = 206'h1c78362c702f7304d425d139be1a4beac9714a8366213c549fda;
    stim[24] = 206'h2366f693dfa42ebf6aed8496f2e64d1e658e6aa1a838d355e897;
    stim[25] = 206'h2ff4a22de7e71101fef3eb049100875cb65f2e3f62c47e22872e;
    stim[26] = 206'h0665fbd98099a69c1b50420487596fe1d8aa33f36f0806d3ef16;
    stim[27] = 206'h01548922bfdc9cb919d1611e9421f146481c665aa4de0ff7a5de;
    stim[28] = 206'h3a517fc852bde93a56d0f678308319b1cf3414e65358a3ce3dcb;
    stim[29] = 206'h2226aaf8ff05170299340f40e6f6b13d59578cd4c8df364d01db;
    stim[30] = 206'h3eb2e22888d9241fceee505a9e4e73bed8141d7009202d7ff606;
    stim[31] = 206'h09f322d6b42a7966d6846304af4d9471339b33337c713ce63273;
    stim[32] = 206'h12b181a117ecb499e703f56a6f4c3a9300263ad001a7acc6a8da;
    stim[33] = 206'h1d649832e781311d20dc19ec49cc6a2983b90fa4dea511404e3b;
    stim[34] = 206'h32782f7f7eb392cdde2f75d975823e613b5fbf9c1be91d4fa1e6;
    stim[35] = 206'h04b56044d314e82ee05cb79691787ebe507d45fe6bbb9b0f69ae;
    stim[36] = 206'h20654b9b7ea7161bffc02aa736373e20d5be0983968cd775badb;
    stim[37] = 206'h27e636d763aaaf4bd81d0d1eaae819e9c906233731c947721efb;
    stim[38] = 206'h139d929e63ddee42d3e7343102d60e19e9f3a42745d1cff7f083;
    stim[39] = 206'h39844644cea52a328cc3921a8e2a40875bdf57eb82cb5cc2ac9d;
    stim[40] = 206'h2c8d1f836a613600a5593ee5100e16b167a1d8ae3ae669c4e593;
    stim[41] = 206'h2ac68f67e98c14cdd8ea2444c2c37857f09d08d0cc24b8f4573a;
    stim[42] = 206'h29a55d82bd13b58daad79bef6f7d80835e227924e873a600e74d;
    stim[43] = 206'h06ac34c8700b24c3b496fb0dd484b2721511d519bf39a500b021;
    stim[44] = 206'h32135d9509e934ab9d4cd0cb98c91e5187bde3e4e2ca2b9d6e79;
    stim[45] = 206'h177bb2ab2cbc1f58bc7d585a5b3beb1361ead8280fcfd01d580b;
    stim[46] = 206'h182a102b8e1be0f6062c6e0d81563033f3de1e8f21c2358c3926;
    stim[47] = 206'h2878ce2c151e7fd4bd62903a7f36e3fde8e5ee41c3579306819b;
    stim[48] = 206'h2de545e0dca783593512fe31a33c9d16a8a2d04e53dbfb241a42;
    stim[49] = 206'h3fbd93274619fc6659b1bbfaf5efab44bd6f5e80fc51661ba4e6;
    stim[50] = 206'h1e4e54c2d394b4b0daf86d9c4ef86547b428f283b495f9993216;
    stim[51] = 206'h15a7b630466dd980e74ed5ff6db6013a9f32d8a39df8b6365b41;
    stim[52] = 206'h274a092d3aa6004ed91f7b32f572e86ab5b886fad95880e2eac3;
    stim[53] = 206'h3907690688e6fc916d64e0dfc646a60856409138c008caa462af;
    stim[54] = 206'h05edc489ee83ff6258fd6b28c7f0730006d6d410049aef9bb8fe;
    stim[55] = 206'h0ef4fff936db38928e1712e201ed995f56aa450e292295b3dc7a;
    stim[56] = 206'h0d6c4b668ffdbe28a00da596371c2fbf2ccd8fe0637467db6172;
    stim[57] = 206'h0b32a10153e3121ccdaf82d1e1066bae5101234fffa59a80cc2a;
    stim[58] = 206'h1e7f889bd086143d7dfe6bccecffe97e9a04d04f7b44f7930e48;
    stim[59] = 206'h1de7e4ede894b16d150ba36c8844a453bdc728c4992796f03c18;
    stim[60] = 206'h0010ec9034726f23d2809b236eef06fe2289145c4b7a9042a629;
    stim[61] = 206'h25c8cdcf19a88a823e6de3b1d84a3904ac2a991f5683cbe46b37;
    stim[62] = 206'h246c718389799b31a018013dcc19e20616d2b17b4ff003cad8d8;
    stim[63] = 206'h28d78e11b98221d01e40aafffb4440ee26b3bedabad293b2d555;
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
      expv[0] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 80'h4c6a8db6f43f8420e784;
      expv[9] = 80'h2a48e3b56e2f8496eba8;
      expv[10] = 80'h2a48e3b56e2f8496eba8;
      expv[11] = 80'hf7b374f6a6d46b30348f;
      expv[12] = 80'h6937f5c261bbc5819da0;
      expv[13] = 80'h6937f5c261bbc5819da0;
      expv[14] = 80'he321082353425976d954;
      expv[15] = 80'he321082353425976d954;
      expv[16] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 80'h6d6b00eafc7162a3606b;
      expv[19] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 80'h9fc3251749501348d088;
      expv[27] = 80'h9fc3251749501348d088;
      expv[28] = 80'h9fc3251749501348d088;
      expv[29] = 80'h9fc3251749501348d088;
      expv[30] = 80'h9fc3251749501348d088;
      expv[31] = 80'hf68c7408b36b7e2542c6;
      expv[32] = 80'hf68c7408b36b7e2542c6;
      expv[33] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 80'h02d60e19e9f3a42745d1;
      expv[40] = 80'h557c7f828b814c9a07a0;
      expv[41] = 80'h100e16b167a1d8ae3ae6;
      expv[42] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 80'h6f7d80835e227924e873;
      expv[44] = 80'hd484b2721511d519bf39;
      expv[45] = 80'hd484b2721511d519bf39;
      expv[46] = 80'hd484b2721511d519bf39;
      expv[47] = 80'hd484b2721511d519bf39;
      expv[48] = 80'hd484b2721511d519bf39;
      expv[49] = 80'ha33c9d16a8a2d04e53db;
      expv[50] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 80'h6db6013a9f32d8a39df8;
      expv[53] = 80'h6db6013a9f32d8a39df8;
      expv[54] = 80'h6db6013a9f32d8a39df8;
      expv[55] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 80'hxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 80'hf7b62ec445c7064d34d9;
      expv[61] = 80'hf7b62ec445c7064d34d9;
      expv[62] = 80'hd84a3904ac2a991f5683;
      expv[63] = 80'hd84a3904ac2a991f5683;
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
