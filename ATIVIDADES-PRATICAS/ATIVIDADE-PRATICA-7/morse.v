module morse (in, out, reset, clk);

    input in, reset, clk;
    output reg [7:0] out;

    parameter A = 5'b00001, B = 5'b00010, C = 5'b00011, D = 5'b00100, E = 5'b00101, 
              F = 5'b00110, G = 5'b00111, H = 5'b01000, I = 5'b01001, J = 5'b01010,
              K = 5'b01011, L = 5'b01100, M = 5'b01101, N = 5'b01110, O = 5'b01111,
              P = 5'b10000, Q = 5'b10001, R = 5'b10010, S = 5'b10011, T = 5'b10100,
              U = 5'b10101, V = 5'b10110, W = 5'b10111, X = 5'b11000, Y = 5'b11001,
              Z = 5'b11010, IDLE = 5'bxxxxx;

    reg [5:0] state, next_state;

    // Lógica Sequencial    
    always @(posedge clk) begin
        if (reset)
            state = IDLE;
        else
            state = next_state;        
    end
    
    // Lógica Combinacional de entrada
    always @(*) begin
        case (state)   // 1 -> ponto 0 -> traço
            IDLE: begin
                if (in)
                    next_state = E; // .
                else
                    next_state = T; // -
            end   
            E: begin
                if (in)
                    next_state = I; // ..
                else
                    next_state = A; // .-
            end
            A: begin
                if (in)
                    next_state = R; // .-.
                else
                    next_state = W; // .--
            end
            R: begin
                if (in)
                    next_state = L; // .-..
                else
                    next_state = IDLE;
            end
            W: begin
                if (in)
                    next_state = P; // .--.
                else
                    next_state = J; // .---
            end
            I: begin
                if (in)
                    next_state = S; // ...
                else 
                    next_state = U; // ..-
            end 
            S: begin
                if (in)
                    next_state = H; // ....
                else
                    next_state = V; // ...-
            end
            U: begin
                if (in) 
                    next_state = F; //..-.
                else 
                    next_state = IDLE;
            end
            T: begin
                if (in)
                    next_state = N; // -.
                else
                    next_state = M; // --
            end
            M: begin
                if (in)
                    next_state = G; // --.
                else
                    next_state = O; // ---
            end
            G: begin
                if (in)
                    next_state = Z; // --..
                else
                    next_state = Q; // --.-
            end
            N: begin
                if (in)
                    next_state = D; // -..
                else
                    next_state = K; // -.-
            end
            D: begin
                if (in)
                    next_state = B; // -...
                else
                    next_state = X; // -..-
            end
            K: begin
                if (in)
                    next_state = C; // -.-.
                else 
                    next_state = Y; // -.--
            end
                             
            default: next_state = IDLE;
        endcase
        
    end

    // Lógica Combinacional de saída
    always @(*) begin
        case (state)
            IDLE: out = 8'h00;
            A: out = 8'h41; 
            B: out = 8'h42; 
            C: out = 8'h43;
            D: out = 8'h44;
            E: out = 8'h45;
            F: out = 8'h46;
            G: out = 8'h47;
            H: out = 8'h48;
            I: out = 8'h49;
            J: out = 8'h4A;
            K: out = 8'h4B;
            L: out = 8'h4C;
            M: out = 8'h4D;
            N: out = 8'h4E;
            O: out = 8'h4F;
            P: out = 8'h50;
            Q: out = 8'h51;
            R: out = 8'h52;
            S: out = 8'h53;
            T: out = 8'h54;
            U: out = 8'h55;
            V: out = 8'h56;
            W: out = 8'h57;
            X: out = 8'h58;
            Y: out = 8'h59;
            Z: out = 8'h5A;
            default: next_state = IDLE;
        endcase
    end
endmodule